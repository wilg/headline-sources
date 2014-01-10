module HeadlineSources
  require "thor"
  require 'colorize'

  class CommandLine < Thor

    desc "fetch SOURCE", "fetch headlines from a sources"
    method_option :continue, :default => false, type: :boolean, aliases: "-c"
    method_option :progress, type: :numeric, aliases: "-p"
    def fetch(source)
      $stdout.sync = true

      begin
        fetcher = Source.find(source).fetcher
      rescue Exception
        puts "Couldn't find the source '#{source}'".red
        return
      end
      puts "Fetching with #{fetcher.class.to_s}"

      if options[:progress]
        puts "Starting at progress #{options[:progress]}."
        fetcher.fetch!({start_at: options[:progress], write_progress: false})
      elsif options[:continue] == true
        puts "Continuing from last progress."
        fetcher.fetch!
      else
        puts "Starting at beginning."
        fetcher.fetch!({start_at: 0, write_progress: false})
      end

    end

    desc "batch", "batch fetch new items from all sources"
    def batch
      Source.all.each do |source|
        begin
          puts "Fetching #{source.name}".cyan
          source.fetcher.fetch!({start_at: 0, write_progress: false})
        rescue Exception
          puts "Error occured on source '#{source}'".red
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

  end
end