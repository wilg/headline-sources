require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class ValleywagFetcher < GawkerFetcher

    def gawker_domain
      "valleywag.gawker.com"
    end

  end
end