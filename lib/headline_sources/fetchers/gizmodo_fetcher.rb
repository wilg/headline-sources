require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class GizmodoFetcher < RSSFetcher
    def feed_url
      "http://feeds.gawker.com/gizmodo/full"
    end
  end
  class GizmodoFetcher2 < GawkerFetcher
    def gawker_domain
      "gizmodo.com"
    end
  end
end
