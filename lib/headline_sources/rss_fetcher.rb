require 'feedjira'
require 'open-uri'
require "headline_sources/fetcher"

module HeadlineSources
  class RSSFetcher < Fetcher

    def perform_partial_fetch!
      feeds = Feedjira::Feed.fetch_and_parse([feed_url].flatten)
      feeds.values.each do |feed|
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
      raise "Scraper not subclassed correctly"
    end

  end
end
