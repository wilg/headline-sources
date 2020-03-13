require "headline_sources/scraper"

module HeadlineSources

  class GuardianBlogsFetcher < RSSFetcher
    def feed_url
      ["http://www.theguardian.com/uk/rss", "http://www.theguardian.com/us/rss"]
    end
  end
end
