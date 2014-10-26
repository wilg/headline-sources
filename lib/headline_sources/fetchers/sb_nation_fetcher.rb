require "headline_sources/scraper"

module HeadlineSources
  class SbNationFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/sportsblogs/sbnation.xml"
    end
  end
  class SbNationFetcher2 < Scraper

    def url_for_progress(n)
      "http://www.sbnation.com/latest-news/archives/#{n}/"
    end

    def headline_css_selector
      'header h3 a'
    end

  end
end
