require "headline_sources/scraper"

module HeadlineSources
  class MacrumorsFetcher < RSSFetcher
    def feed_url
      "http://feeds.macrumors.com/MacRumors-All"
    end
  end
  class MacrumorsFetcher2 < Scraper

    def url_for_progress(n)
      "http://www.macrumors.com/#{n}/"
    end

    def headline_css_selector
      '.article .title a'
    end

  end
end
