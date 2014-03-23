require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class SploidFetcher < GawkerFetcher

    def gawker_domain
      "sploid.gizmodo.com"
    end

  end
end
