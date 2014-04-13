require 'nokogiri'
require 'open-uri'
require 'yaml'
require 'colorize'
require 'active_support/inflector'
require 'active_support/core_ext/string'

module HeadlineSources
  class Fetcher

    def reformat!
      @dont_write_progress = true
      @headlines = current_contents
      write_file
    end

    def fetch!(options = {})
      saved_progress = YAML.load_file(progress_file_path)[id]
      options = {start_at: saved_progress, write_progress: true}.merge(options)

      @push_through_repeats = true if options[:push_through_repeats] == true
      @push_through_failures = true if options[:push_through_failures] == true

      @dont_write_progress = true if !saved_progress.nil? && options[:write_progress] == false
      @progress = options[:start_at] || 1

      @headlines = current_contents
      @start_headline_count = formatted_headlines.length

      perform_fetch!
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

          page_start = formatted_headlines.length
          out = perform_partial_fetch!
          page_end = formatted_headlines.length

          @repeated_page_count += 1 if page_end - page_start == 0

          write_file

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
          return if @failure_count >= FAILURE_LIMIT && !@push_through_failures
        end
      end
    end

    def formatted_headlines
      @headlines.select{|x| is_valid?(x) }.map{|h| format_headline(h) }.uniq
    end

    def perform_partial_fetch!
      # Subclass me!
    end

    def new_headlines_this_run
      formatted_headlines.length - @start_headline_count
    end

    def dictionary_path
      File.expand_path("../../../db/#{id}.txt", __FILE__)
    end

    def current_contents
      if File.exists? dictionary_path
        File.readlines(dictionary_path).map{|l| l.chomp.strip}
      else
        []
      end
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
      formatted_headline = format_headline(headline)
      if is_valid?(headline) && !@headlines.include?(formatted_headline)
        bef = formatted_headlines.length
        @headlines << formatted_headline
        af = formatted_headlines.length
        if bef != af
          puts "    -> " + formatted_headline unless ENV['FETCHER_QUIET'].to_i == 1
        end
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
      headline.gsub(/\r/, " ").gsub(/\n/, " ").gsub(/\u00a0/, ' ').chomp.strip.squeeze(" ")
    end

    def write_file
      headlines = formatted_headlines.sort
      File.open(dictionary_path, 'w') {|f| f.write(headlines.join("\n")) }
      write_progress unless @dont_write_progress == true
    end

    def progress_file_path
      File.expand_path("../../db/fetch_progress.yml", File.dirname(__FILE__))
    end

    def write_progress
      prog = YAML.load_file(progress_file_path)
      prog[id] = @progress
      File.open(progress_file_path, 'w') {|f| f.write prog.to_yaml }
    end

    def current_progress
      YAML.load_file(progress_file_path)[id] || nil
    end

  end
end
