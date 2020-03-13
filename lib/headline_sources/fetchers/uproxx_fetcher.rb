require "headline_sources/scraper"

module HeadlineSources
  class UproxxFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/uproxx/features"
    end
  end
end
