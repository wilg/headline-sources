require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class GizmodoFetcher < GawkerFetcher

    def gawker_domain
      "gizmodo.com"
    end

  end
end