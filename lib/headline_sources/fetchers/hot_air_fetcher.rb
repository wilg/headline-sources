require "headline_sources/scraper"

module HeadlineSources
  class HotAirFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/hotair/main"
    end
  end
  class HotAirFetcher2 < Scraper

    def url_for_progress(n)
      "http://hotair.com/headlines/page/#{n}/"
    end

    def headline_css_selector
      '.hl-title a'
    end

  end
end
