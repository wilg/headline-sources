module HeadlineSources
  require "thor"
  require 'colorize'
  require 'uri'

  class CommandLine < Thor

    desc "fetch SOURCE", "fetch headlines from a sources"
    method_option :continue, :default => false, type: :boolean, aliases: "-c"
    method_option :progress, type: :numeric, aliases: "-p"
    method_option :push_through_repeats, type: :boolean, default: false, aliases: "-r"
    method_option :push_through_failures, type: :boolean, default: false, aliases: "-f"
    method_option :database, :default => false, type: :boolean, aliases: "--db"
    def fetch(source)
      $stdout.sync = true

      begin
        fetchers = Source.find(source).fetchers(options[:database] ? ActiveRecordStore : FileStore)
      rescue StandardError
        puts "Couldn't find the source '#{source}'".red
        return
      end

      if options[:database]
        puts "Dumping sources to database.".cyan
        ActiveRecordStore.dump_sources!
      end

      fetchers.each do |fetcher|

        puts "Fetching #{fetcher.id} with #{fetcher.class.to_s}".cyan

        default_options = {push_through_repeats: options[:push_through_repeats], push_through_failures: options[:push_through_failures]}

        if options[:progress]
          puts "Starting at progress #{options[:progress]}.".green
          fetcher.fetch!(default_options.merge({start_at: options[:progress], write_progress: false}))
        elsif options[:continue] == true
          puts "Continuing from last progress.".green
          fetcher.fetch!(default_options)
        else
          puts "Starting at beginning.".green
          fetcher.fetch!(default_options.merge({start_at: 0, write_progress: false}))
        end

      end

    end

    desc "batch", "batch fetch new items from all sources"
    method_option :database, :default => false, type: :boolean, aliases: "--db"
    def batch
      if options[:database]
        batch_to_database
      else
        batch_to_file
      end
    end

    desc "check", "check which sources are working"
    method_option :halt_on_failure, :default => false, type: :boolean, aliases: "-i"
    method_option :skip, type: :array, aliases: "-s"
    method_option :dead_on_failure, type: :boolean, aliases: "--kill"
    def check
      working = []
      skips = options[:skip] || []
      Source.all.each do |source|
        next if source.dead
        next if skips.include?(source.id.to_s)
        puts "Checking source #{source.name} (#{source.id})".cyan
        begin
          source.fetchers(MemoryStore).each do |fetcher|
            fetcher.fetch!({start_at: 0, write_progress: false, dry_run: true})
            if fetcher.new_headlines_this_run.zero?
              puts "Fetcher #{fetcher.class.to_s} ran, but did not fetch any headlines. It may be broken.".red
              raise
            end
          end
          working << source.id
        rescue StandardError
          puts "Error occured on source '#{source.name}'".red
          if options[:dead_on_failure]
            update_config(source.id, {"dead" => true})
          end
          if options[:halt_on_failure]
            puts "To try again while skipping successes, use this command:"
            puts "bin/headline-sources check -i -s #{(skips + working).join(" ")}"
            break
          end
        end
      end
    end

    no_commands do
      def batch_to_file
        pids = []
        Source.all.shuffle.each do |source|
          begin
            pids << Process.fork do
              puts "Forked #{source.name} onto pid #{Process.pid}".green
              source.fetchers.each do |fetcher|
                fetcher.fetch!({start_at: 0, write_progress: false})
              end
            end
          rescue StandardError
            puts "Error occured on source '#{source.name}'".red
          end
        end
        puts "Parent process (pid #{Process.pid}), waiting on fetchers #{pids.join(', ')}."
        Process.wait
      end

      def batch_to_database
        puts "Dumping sources to database.".cyan
        ActiveRecordStore.dump_sources!
        Source.all.shuffle.each do |source|
          puts "Fetching source #{source.name}".cyan
          begin
            source.fetchers(ActiveRecordStore).each do |fetcher|
              fetcher.fetch!({start_at: 0, write_progress: false})
            end
          rescue StandardError
            puts "Error occured on source '#{source.name}'".red
          end
        end
      end

      def sources_path
        File.expand_path("../../../db/sources.yml", __FILE__)
      end

      def get_config(source_id)
        current_sources = YAML.load_file(sources_path)
        current_sources[source_id.to_s]
      end

      def set_config(source_id, contents)
        current_sources = YAML.load_file(sources_path)
        current_sources[source_id.to_s] = contents
        File.write(sources_path, current_sources.to_yaml)
      end

      def update_config(source_id, delta)
        current = get_config(source_id) || {}
        set_config(source_id, current.merge(delta))
      end
    end

    desc "format", "reformat existing headlines from all sources"
    def format
      Source.all.each do |source|
        begin
          puts "Reformatting #{source.name}".cyan
          source.fetchers.first.reformat!
        rescue StandardError
          puts "Error occured on source '#{source.name}'".red
        end
      end
    end

    desc "list", "list available sources"
    def list
      max_id = 0
      Source.all.each do |f|
        max_id = f.id.length if f.id.length > max_id
        r = ""
        (max_id - f.id.length).times do
          r << " "
        end
        puts "#{f.id}#{r}\t#{f.name.cyan}"
      end
    end

    desc "add", "attempt to add a website to the list of fetchers"
    def add_site(url, id = nil)
      puts url

      # Find Feeds
      require "feedbag"
      feeds = Feedbag.find(url)
      unless feeds.present?
        puts "Couldn't find any feeds."
      end
      feeds.each do |feed|
        puts "Found feed: #{feed}"
      end

      uri = URI.parse(url)
      id ||= uri.host.split(".")[-2]
      puts "ID for source: #{id}"

      # Update YML
      current = get_config(id) || {}
      current_rss = current["rss"]

      update = {}
      update["name"] = id.humanize if current["name"].blank?
      update["rss"] = (current_rss || []) + (feeds || [])

      is_dead = update["rss"].blank?
      update["dead"] = true if is_dead
      update.delete("dead") unless is_dead
      update.delete("rss") if is_dead

      if current.blank? && !feeds.present?
        puts "Not adding because no feeds were found."
        return
      end

      update_config(id, update)

      # Fetch Favicon
      require 'faviconduit'
      begin
        fav = Faviconduit.get(url)
        puts "Found favicon at #{fav.url}"
      rescue Faviconduit::MissingFavicon
        puts "favicon missing"
      rescue Faviconduit::InvalidFavicon
        puts "favicon invalid"
      rescue Errno::ENOENT => e
        puts "favicon invalid"
        puts e
      end

      require 'rmagick'

      if fav && fav.data
        img_path = File.expand_path("../../../app/assets/images/headline_sources/#{id}.png", __FILE__)
        path = Tempfile.new(["favicons", File.extname(URI.parse(fav.url).path)]).path
        File.open(path, 'w') do |file|
          file.write(fav.data)
        end
        img = Magick::Image.read(path).first
        File.write(img_path, img.to_blob { self.format = "png" })
        "Saved favicon!"
      end

    end

    desc "populate_database", "copy everything from the FileStore into the ActiveRecordStore"
    def populate_database
      file_store = FileStore.new
      db_store = ActiveRecordStore.new
      Source.all.each do |source|
        puts "Copying source #{source.name}".cyan
        stored_headlines = file_store.current_contents(source.id)
        stored_headlines.each_slice(50) do |headlines|
          added = db_store.add_headlines!(source.id, headlines.map{|h| Headline.new(h)})
          added.each do |h|
            puts(("    -> " + h.name).green)
          end
        end
      end
      db_store.close!
      file_store.close!
    end

  end
end
