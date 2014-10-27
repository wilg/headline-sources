require "headline_sources/scraper"

module HeadlineSources
  class UproxxFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/uproxx/features"
    end
  end
  class UproxxFetcher2 < Scraper

    def url_for_progress(n)
      "http://www.uproxx.com/page/#{n}/"
    end

    def headline_css_selector
      '.block h1 a'
    end

  end
end
