require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class Io9Fetcher < GawkerFetcher

  	def gawker_domain
  	  "io9.com"
  	end

  end
end