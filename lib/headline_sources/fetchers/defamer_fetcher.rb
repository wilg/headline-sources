require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class DefamerFetcher < RSSFetcher
    def feed_url
      "http://feeds.gawker.com/defamer/full"
    end
  end
  class DefamerFetcher2 < GawkerFetcher
    def gawker_domain
      "defamer.gawker.com"
    end
  end
end
