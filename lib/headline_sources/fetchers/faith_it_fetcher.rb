require "headline_sources/scraper"

module HeadlineSources
  class FaithItFetcher < RSSFetcher
    def feed_url
      "http://www.faithit.com/feed/"
    end
  end
  class FaithItFetcher2 < Scraper

    def url_for_progress(i)
      "http://www.faithit.com/page/#{i}/"
    end

    def headline_css_selector
      '.thumbnail a.title'
    end

  end
end
