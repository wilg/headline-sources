require "headline_sources/scraper"

module HeadlineSources
  class HotAirFetcher < Scraper

    def url_for_progress(n)
      "http://hotair.com/headlines/page/#{n}/"
    end

    def headline_css_selector
      '.hl-title a'
    end

  end
end