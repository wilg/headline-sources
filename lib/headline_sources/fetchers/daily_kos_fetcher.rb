require "headline_sources/scraper"

module HeadlineSources
  class DailyKosFetcher < RSSFetcher
    def feed_url
      "http://feeds.dailykos.com/dailykos/index.xml"
    end
  end
  class DailyKosFetcher2 < Scraper

    def url_for_progress(n)
      "http://www.dailykos.com/main/#{n}/"
    end

    def headline_css_selector
      '.article .meta h2 a'
    end

  end
end
