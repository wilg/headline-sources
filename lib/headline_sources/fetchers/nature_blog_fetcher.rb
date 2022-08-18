require "headline_sources/scraper"

module HeadlineSources
  class NatureBlogFetcher < RSSFetcher
    def feed_url
      "http://feeds.nature.com/nature/rss/current"
    end
  end
end
