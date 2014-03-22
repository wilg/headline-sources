require 'rss'
require 'open-uri'
require "headline_sources/fetcher"

module HeadlineSources
  class RSSFetcher < Fetcher

    def perform_partial_fetch!
      [feed_url].flatten.each do |url|
        open(url) do |rss|
          feed = RSS::Parser.parse(rss)
          feed.items.each do |item|
            add_headline! item.title
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
