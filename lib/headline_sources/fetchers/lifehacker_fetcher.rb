require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class LifehackerFetcher < RSSFetcher
    def feed_url
      "http://feeds.gawker.com/lifehacker/full"
    end
  end
  class LifehackerFetcher2 < GawkerFetcher

  	def gawker_domain
  	  "lifehacker.com"
  	end

  end
end
