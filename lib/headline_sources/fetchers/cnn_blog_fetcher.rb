require "headline_sources/scraper"

module HeadlineSources
  class CnnBlogFetcher < RSSFetcher

    def feed_url
      [
        "http://rss.cnn.com/rss/cnn_topstories.rss",
        "http://rss.cnn.com/rss/cnn_world.rss",
        "http://rss.cnn.com/rss/cnn_us.rss",
        "http://rss.cnn.com/rss/money_latest.rss",
        "http://rss.cnn.com/rss/cnn_allpolitics.rss",
        "http://rss.cnn.com/rss/cnn_crime.rss",
        "http://rss.cnn.com/rss/cnn_tech.rss",
        "http://rss.cnn.com/rss/cnn_health.rss",
        "http://rss.cnn.com/rss/cnn_showbiz.rss",
        "http://rss.cnn.com/rss/cnn_travel.rss",
        "http://rss.cnn.com/rss/cnn_living.rss",
        "http://rss.cnn.com/rss/cnn_freevideo.rss",
        "http://rss.cnn.com/rss/cnn_studentnews.rss",
        "http://rss.cnn.com/rss/cnn_mostpopular.rss",
        "http://rss.cnn.com/rss/cnn_latest.rss",
        "http://rss.ireport.com/feeds/oncnn.rss",
        "http://rss.cnn.com/rss/cnn_behindthescenes.rss"
      ]
    end

  end
end
