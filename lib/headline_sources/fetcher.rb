require 'nokogiri'
require 'open-uri'
require 'yaml'
require 'colorize'

# $stdout.sync = true

module HeadlineSources
  class Fetcher

    def ignore_progress?
      ENV['FETCHER_IGNORE_PROGRESS'].to_i == 1
    end

    def fetch!
      @headlines = current_contents.uniq
      @progress  = YAML.load_file(progress_file_path)[id] || 0
      @progress  = 0 if ignore_progress?

      @start_headline_count = @headlines.length

      puts "Starting from progress #{@progress} with #{@headlines.uniq.count} unique headlines.".yellow

      # Subclass me!
    end

    def new_headlines_this_run
      @headlines.uniq.select{|x| is_valid?(x) }.length - @start_headline_count
    end

    def dictionary_path
      File.expand_path("../../db/#{id}.txt", __FILE__)
    end

    def current_contents
      if File.exists? dictionary_path
        File.readlines(dictionary_path).map{|l| l.chomp.strip}
      else
        []
      end
    end

    def id
      path = self.class.instance_methods(false).map { |m|
        self.class.instance_method(m).source_location.first
      }.uniq.first
      File.basename(path).split("_fetcher").first
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
      write_progress unless ignore_progress?
    end

    def progress_file_path
      File.expand_path("../db/fetch_progress.yml", File.dirname(__FILE__))
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