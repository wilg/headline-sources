require "headline_sources/scraper"
module HeadlineSources
  class MashableFetcher < RSSFetcher

    def feed_url
      "http://feeds.mashable.com/Mashable"
    end

  end
end
