module HeadlineSources
  require "thor"
  require 'colorize'

  class CommandLine < Thor

    desc "fetch SOURCE", "fetch headlines from a sources"
    method_option :continue, :default => false
    def fetch(source)
      $stdout.sync = true

      fetcher = Fetcher.find(source)
      puts "Fetching with #{fetcher.class.to_s}"

      if options[:continue] == true
        puts "Continuing from last progress."
        fetcher.fetch!
      else
        puts "Starting at beginning."
        fetcher.fetch!(start_at: 0, write_progress: false)
      end

    end

    desc "list", "list available sources"
    def list
      Fetcher.all.each do |f|
        puts f
      end
    end

  end
end