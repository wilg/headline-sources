require "headline_sources/scraper"

module HeadlineSources
  class SpinFetcher < RSSFetcher
    def feed_url
      %w[http://www.spin.com/reviews/rss/
      http://www.spin.com/news/rss/
      http://www.spin.com/lists/rss/
      http://www.spin.com/culture/rss/
      http://www.spin.com/interviews/rss/
      http://www.spin.com/photos/rss/]
    end
  end
end
