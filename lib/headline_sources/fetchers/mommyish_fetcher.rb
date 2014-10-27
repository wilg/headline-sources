require "headline_sources/scraper"

module HeadlineSources
  class MommyishFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/b5media/mommyish"
    end
  end
  class MommyishFetcher2 < Scraper

    def url_for_progress(n)
      "http://www.mommyish.com/page/#{n}/"
    end

    def headline_css_selector
      'h2.entry-title a'
    end

  end
end
