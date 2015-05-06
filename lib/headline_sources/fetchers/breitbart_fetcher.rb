require "headline_sources/scraper"

module HeadlineSources
  class BreitbartFetcher < RSSFetcher

    def feed_url
      "http://feeds.feedburner.com/breitbart"
    end

  end
end
