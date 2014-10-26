require "headline_sources/scraper"

module HeadlineSources
  class AlternetFetcher < RSSFetcher

    def feed_url
      "http://feeds.feedblitz.com/alternet"
    end

  end
end
