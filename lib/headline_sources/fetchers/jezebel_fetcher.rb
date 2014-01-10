require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class JezebelFetcher < GawkerFetcher

  	def gawker_domain
  	  "jezebel.com"
  	end

  end
end