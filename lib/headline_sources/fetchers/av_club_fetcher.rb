require "headline_sources/scraper"

module HeadlineSources
  class AvClubFetcher < RSSFetcher
    def feed_url
      "http://www.avclub.com/feed/rss/"
    end
  end
  class AvClubFetcher2 < Scraper

    def url_for_progress(n)
      "http://www.avclub.com/search?page=#{n}"
    end

    def headline_css_selector
      'h1 a'
    end

  end
end
