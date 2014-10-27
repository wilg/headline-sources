require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources
  class KotakuFetcher < RSSFetcher
    def feed_url
      "http://feeds.gawker.com/kotaku/full"
    end
  end
  class KotakuFetcher2 < GawkerFetcher

  	def gawker_domain
  	  "kotaku.com"
  	end

  end
end
