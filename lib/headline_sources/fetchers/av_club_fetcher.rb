require "headline_sources/scraper"

module HeadlineSources
  class AvClubFetcher < RSSFetcher
    def feed_url
      "http://www.avclub.com/feed/rss/"
    end
  end
end
