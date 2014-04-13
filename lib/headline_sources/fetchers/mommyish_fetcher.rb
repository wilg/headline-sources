require "headline_sources/scraper"

module HeadlineSources
  class MommyishFetcher < Scraper

    def url_for_progress(n)
      "http://www.mommyish.com/page/#{n}/"
    end

    def headline_css_selector
      'h2.entry-title a'
    end

  end
end
