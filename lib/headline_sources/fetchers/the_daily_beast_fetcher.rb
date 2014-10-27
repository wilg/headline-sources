require "headline_sources/scraper"

module HeadlineSources
  class TheDailyBeastFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/thedailybeast/articles"
    end
  end
end
