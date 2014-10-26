require "headline_sources/scraper"

module HeadlineSources
  class RawstoryFetcher < RSSFetcher

    def feed_url
      "http://www.rawstory.com/rs/feed/"
    end

  end
end
