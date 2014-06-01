require "headline_sources/scraper"

module HeadlineSources
  class FoxnewsFetcher < RSSFetcher

    def feed_url
      [
        'http://feeds.foxnews.com/foxnews/latest',
        'http://feeds.foxnews.com/foxnews/most-popular',
        'http://feeds.foxnews.com/foxnews/entertainment',
        'http://feeds.foxnews.com/foxnews/health',
        'http://feeds.foxnews.com/foxnews/section/lifestyle',
        'http://feeds.foxnews.com/foxnews/opinion',
        'http://feeds.foxnews.com/foxnews/politics',
        'http://feeds.foxnews.com/foxnews/science',
        'http://feeds.foxnews.com/foxnews/sports',
        'http://feeds.foxnews.com/foxnews/tech',
        'http://feeds.foxnews.com/foxnews/internal/travel/mixed',
        'http://feeds.foxnews.com/foxnews/national',
        'http://feeds.foxnews.com/foxnews/video',
        'http://feeds.foxnews.com/foxnews/world',
      ]
    end

  end
end
