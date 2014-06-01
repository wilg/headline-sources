require "headline_sources/scraper"

module HeadlineSources
  class BuzzfeedFetcher < RSSFetcher

    def feed_url
      'http://www.buzzfeed.com/index.xml'
    end

  end
end
