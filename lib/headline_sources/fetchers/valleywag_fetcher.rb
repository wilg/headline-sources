require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class ValleywagFetcher < RSSFetcher
    def feed_url
      "http://feeds.gawker.com/valleywag/full"
    end
  end
  class ValleywagFetcher2 < GawkerFetcher

    def gawker_domain
      "valleywag.gawker.com"
    end

  end
end
