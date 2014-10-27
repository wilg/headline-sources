require "headline_sources/scraper"

module HeadlineSources
  class UpworthyFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/upworthy"
    end
  end
  class UpworthyFetcher2 < Scraper

    def url_for_progress(i)
      "http://www.upworthy.com/page/#{i}"
    end

    def headline_css_selector
      '.nugget-info h3 a'
    end

  end
end
