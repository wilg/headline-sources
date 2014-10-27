require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class Io9Fetcher < RSSFetcher
    def feed_url
      "http://feeds.gawker.com/io9/full"
    end
  end
  class Io9Fetcher2 < GawkerFetcher

  	def gawker_domain
  	  "io9.com"
  	end

  end
end
