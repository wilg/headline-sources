require "headline_sources/scraper"

module HeadlineSources

  class BroBibleFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/BroBible"
    end
  end

end
