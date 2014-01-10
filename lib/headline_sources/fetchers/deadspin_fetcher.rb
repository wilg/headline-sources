require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class DeadspinFetcher < GawkerFetcher

    def gawker_domain
      "deadspin.com"
    end

  end
end