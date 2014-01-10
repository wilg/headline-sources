require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class DefamerFetcher < Scraper

    def gawker_domain
      "defamer.gawker.com"
    end

  end
end