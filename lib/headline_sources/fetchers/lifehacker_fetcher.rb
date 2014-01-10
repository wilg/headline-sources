require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class LifehackerFetcher < GawkerFetcher

  	def gawker_domain
  	  "lifehacker.com"
  	end

  end
end