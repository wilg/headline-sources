require 'nokogiri'
require 'open-uri'
require 'yaml'
require 'colorize'
require 'active_support/inflector'
require 'active_support/core_ext/string'

module HeadlineSources
  class Fetcher

    def initialize(store_class = FileStore)
      @store = store_class.new
    end

    def fetch!(options = {})
      saved_progress = YAML.load_file(progress_file_path)[id] rescue nil
      options = {start_at: saved_progress, write_progress: true}.merge(options)

      @new_count = 0
      @dup_count = 0

      @push_through_repeats = true if options[:push_through_repeats] == true
      @push_through_failures = true if options[:push_through_failures] == true
      @dry_run = true if options[:dry_run] == true

      @dont_write_progress = true if !saved_progress.nil? && options[:write_progress] == false
      @progress = options[:start_at] || 1
      @quiet = options[:quiet] == true

      perform_fetch!

      @store.close!
    end

    def puts(str)
      $stdout.puts "    #{str}"
    end

    FAILURE_LIMIT = 3
    REPEAT_PAGE_LIMIT  = 3

    def perform_fetch!
      # You can replace this in a subclass if you want, or just use perform_partial_fetch!
      @failure_count = 0
      @repeated_page_count = 0
      @progress = @progress || 0
      while true
        begin

          @batch = []

          out = perform_partial_fetch!

          added = @store.add_headlines!(id, @batch)

          @repeated_page_count += 1 if added.length == 0
          @new_count += added.length
          @dup_count += @batch.length - added.length

          unless ENV['FETCHER_QUIET'].to_i == 1 || @quiet
            @batch.each do |h|
              s = "    -> " + h.name
              if added.any?{|add| add.name == h.name}
                puts s.green
                puts "       #{h.url}" if h.url
              else
                puts s.red
                puts "       #{h.url}".red if h.url
              end
            end
          end

          write_progress unless @dont_write_progress == true

          if @repeated_page_count == REPEAT_PAGE_LIMIT && !@push_through_repeats
            puts "#{REPEAT_PAGE_LIMIT} fetches without new headlines, done.".yellow
            return
          end
          if out == :done
            puts "Fetcher is done.".yellow
            return
          end

        rescue => e
          @failure_count += 1
          puts "*** Failed on #{@progress} (#{@failure_count} / #{FAILURE_LIMIT})".red
          puts e.to_s.red
          puts "Backtrace:\n\t#{e.backtrace.join("\n\t")}".red
          raise e if @dry_run
          return if @failure_count >= FAILURE_LIMIT && !@push_through_failures
        end

        break if @dry_run
      end
    end

    def perform_partial_fetch!
      raise "Not implemented"
    end

    def new_headlines_this_run
      @new_count
    end

    def self.id_from_path(path)
      File.basename(path).split("_fetcher").first
    end

    def id
      path = self.class.instance_methods(false).map { |m|
        self.class.instance_method(m).source_location.first
      }.uniq.first
      Fetcher.id_from_path(path)
    end

    def add_headline!(headline)
      original_name = headline.name
      headline.name = format_headline(headline.name)
      if is_valid?(original_name) && headline.hash.present?
        @batch << headline
      end
    end

    def is_valid?(headline)
      # We don't want pre-truncated headlines
      # Override me!
      headline[-1, 1] != "…" && !excluded_matches.map{|m| headline.include?(m) }.include?(true)
    end

    def excluded_matches
      # Override me!
      []
    end

    def format_headline(headline)
      # Override me and call super!
      headline.gsub(/\r/, " ").gsub(/\n/, " ").gsub(/\u00a0/, ' ').chomp.strip.squeeze(" ").squish
    end

    def progress_file_path
      File.expand_path("../../db/fetch_progress.yml", File.dirname(__FILE__))
    end

    def write_progress
      prog = YAML.load_file(progress_file_path) rescue {}
      prog[id] = @progress
      File.open(progress_file_path, 'w') {|f| f.write prog.to_yaml }
    end

    def current_progress
      YAML.load_file(progress_file_path)[id] || nil
    end

  end
end
