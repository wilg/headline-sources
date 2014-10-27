require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class DeadspinFetcher < RSSFetcher
    def feed_url
      "http://feeds.gawker.com/deadspin/full"
    end
  end
  class DeadspinFetcher2 < GawkerFetcher
    def gawker_domain
      "deadspin.com"
    end
  end
end
