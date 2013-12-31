require 'nokogiri'
require 'open-uri'
require 'yaml'
require 'colorize'
require 'active_support/inflector'
require 'active_support/core_ext/string'

module HeadlineSources
  class Fetcher

    def fetch!(options = {})
      saved_progress = YAML.load_file(progress_file_path)[id] || 1
      options = {start_at: saved_progress, write_progress: true}.merge(options)

      @dont_write_progress = true if options[:write_progress] == false
      @progress = options[:start_at]

      @headlines = current_contents.uniq
      @start_headline_count = @headlines.length

      puts "Fetching from progress #{@progress} with #{@headlines.uniq.count} unique headlines.".yellow

      perform_fetch!
    end

    def perform_fetch!
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
      headline = headline.chomp.strip
      unless @headlines.include?(headline)
        puts "-> " + headline unless ENV['FETCHER_QUIET'].to_i == 1
        @headlines << headline
      end
    end

    def is_valid?(headline)
      headline[-1, 1] != "…" # We don't want pre-truncated headlines
    end

    def write_file
      headlines = @headlines.uniq.select{|x| is_valid?(x) }
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