require "headline_sources/scraper"
require "headline_sources/fetchers/gawker_fetcher"

module HeadlineSources

  class DefamerFetcher < RSSFetcher
    def feed_url
      "http://defamer.gawker.com/rss"
    end
  end

end
