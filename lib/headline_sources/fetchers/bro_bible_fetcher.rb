require "headline_sources/scraper"

module HeadlineSources

  class BroBibleFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/BroBible"
    end
  end

  class BroBibleFetcher2 < Scraper

    def url_for_progress(n)
      "http://www.brobible.com/page/#{n}/"
    end

    def headline_css_selector
      '.block h1 a'
    end

  end

end
