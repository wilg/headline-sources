require "headline_sources/scraper"

module HeadlineSources
  class NypostFetcher < RSSFetcher
    def feed_url
      ["http://nypost.com/feed/", "http://pagesix.com/feed/"]
    end
  end
  class NypostFetcher2 < Scraper

    def url_for_progress(i)
      "http://nypost.com/news/page/#{i}/"
    end

    def headline_css_selector
      '.entry-header h3 a'
    end

  end
end
