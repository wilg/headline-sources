require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class SploidFetcher < RSSFetcher
    def feed_url
      "http://sploid.gizmodo.com/rss"
    end
  end
  class SploidFetcher2 < GawkerFetcher

    def gawker_domain
      "sploid.gizmodo.com"
    end

  end
end
