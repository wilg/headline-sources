require 'nokogiri'
require 'open-uri'
require 'yaml'
require 'colorize'
require 'active_support/inflector'
require 'active_support/core_ext/string'

module HeadlineSources
  class Fetcher

    def reformat!
      @headlines = current_contents.uniq
      write_file
    end

    def fetch!(options = {})
      saved_progress = YAML.load_file(progress_file_path)[id]
      options = {start_at: saved_progress, write_progress: true}.merge(options)

      @dont_write_progress = true if !saved_progress.nil? && options[:write_progress] == false
      @progress = options[:start_at] || 1

      @headlines = current_contents.uniq
      @start_headline_count = @headlines.length

      puts "Fetching from progress #{@progress} with #{@headlines.uniq.count} unique headlines.".yellow

      perform_fetch!
    end

    FAILURE_LIMIT = 3
    REPEAT_PAGE_LIMIT  = 5

    def perform_fetch!
      # You can replace this in a subclass if you want, or just use perform_partial_fetch!
      @failure_count = 0
      @repeated_page_count = 0
      @progress = @progress || 0
      while true
        begin

          page_start = @headlines.length
          perform_partial_fetch!
          page_end = @headlines.length

          @repeated_page_count += 1 if page_end - page_start == 0

          write_file

          if @repeated_page_count == REPEAT_PAGE_LIMIT
            puts "#{REPEAT_PAGE_LIMIT} repeated partial fetches encountered, stopping.".red
            return
          end

        rescue => e
          @failure_count += 1
          puts "*** Failed on #{@progress} (#{@failure_count} / #{FAILURE_LIMIT})".red
          puts e.to_s
          return if @failure_count >= FAILURE_LIMIT
        end
      end
    end

    def perform_partial_fetch!
      # Subclass me!
    end

    def new_headlines_this_run
      @headlines.uniq.select{|x| is_valid?(x) }.length - @start_headline_count
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
      return unless is_valid?(headline)
      headline = format_headline(headline)
      unless @headlines.include?(headline)
        puts "-> " + headline unless ENV['FETCHER_QUIET'].to_i == 1
        @headlines << headline
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
      headline.chomp.strip.squeeze(" ")
    end

    def write_file
      headlines = @headlines.uniq.select{|x| is_valid?(x) }.map{|h| format_headline(h) }.sort
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