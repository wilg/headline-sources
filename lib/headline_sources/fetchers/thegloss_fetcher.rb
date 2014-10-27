require "headline_sources/scraper"

module HeadlineSources
  class TheglossFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/b5media/thegloss"
    end
  end
  class TheglossFetcher2 < Scraper

    def url_for_progress(n)
      "http://www.thegloss.com/page/#{n}/"
    end

    def headline_css_selector
      'h2.entry-title a'
    end

  end
end
