require 'feedjira'
require 'open-uri'
require "headline_sources/fetcher"
require 'sanitize'
require 'htmlentities'
require 'pmap'

module HeadlineSources
  class RSSFetcher < Fetcher

    attr_accessor :feeds, :preset_id

    def id
      preset_id ? preset_id.to_s : super
    end

    def perform_partial_fetch!
      [feed_url].flatten.peach do |url|
        puts url
        xml = HTTParty.get(url, timeout: 5).body
        feed = Feedjira.parse(xml)
        if feed.respond_to?(:entries)
          feed.entries.each do |entry|
            if entry.title
              h = Headline.new(entry.title)
              h.url  = entry.url
              h.date = entry.published
              h.author = entry.author
              add_headline! h
            end
          end
        end
      end
      :done
    end

    # Override this
    def feed_url
      return @feeds if @feeds
      raise "Scraper not subclassed correctly"
    end


    def format_headline(headline)
      @coder ||= HTMLEntities.new
      @coder.decode(Sanitize.fragment(super))
    end

  end
end
