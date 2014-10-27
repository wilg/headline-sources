require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class JezebelFetcher < RSSFetcher
    def feed_url
      "http://feeds.gawker.com/jezebel/full"
    end
  end
  class JezebelFetcher2 < GawkerFetcher

  	def gawker_domain
  	  "jezebel.com"
  	end

  end
end
