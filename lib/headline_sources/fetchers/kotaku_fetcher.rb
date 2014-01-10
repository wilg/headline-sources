require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class KotakuFetcher < GawkerFetcher

  	def gawker_domain
  	  "kotaku.com"
  	end

  end
end