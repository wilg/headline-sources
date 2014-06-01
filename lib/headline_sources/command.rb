module HeadlineSources
  require "thor"
  require 'colorize'

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
        fetcher = Source.find(source).fetcher(options[:database] ? ActiveRecordStore : FileStore)
      rescue StandardError
        puts "Couldn't find the source '#{source}'".red
        return
      end
      puts "Fetching with #{fetcher.class.to_s}".cyan

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

    desc "batch", "batch fetch new items from all sources"
    method_option :database, :default => false, type: :boolean, aliases: "--db"
    def batch
      if options[:database]
        batch_to_database
      else
        batch_to_file
      end
    end

    no_commands do
      def batch_to_file
        pids = []
        Source.all.each do |source|
          begin
            pids << Process.fork do
              puts "Forked #{source.name} onto pid #{Process.pid}".green
              source.fetcher.fetch!({start_at: 0, write_progress: false})
            end
          rescue StandardError
            puts "Error occured on source '#{source.name}'".red
          end
        end
        puts "Parent process (pid #{Process.pid}), waiting on fetchers #{pids.join(', ')}."
        Process.wait
      end

      def batch_to_database
        Source.all.each do |source|
          puts "Fetching source #{source.name}".cyan
          begin
            source.fetcher(ActiveRecordStore).fetch!({start_at: 0, write_progress: false})
          rescue StandardError
            puts "Error occured on source '#{source.name}'".red
          end
        end
      end
    end

    desc "format", "reformat existing headlines from all sources"
    def format
      Source.all.each do |source|
        begin
          puts "Reformatting #{source.name}".cyan
          source.fetcher.reformat!
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
