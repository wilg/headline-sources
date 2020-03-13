require "headline_sources/scraper"

module HeadlineSources
  class McsweenysFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/mcsweeneys/"
    end
  end
end
