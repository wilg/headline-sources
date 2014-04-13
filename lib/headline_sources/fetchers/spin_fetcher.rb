require "headline_sources/scraper"

module HeadlineSources
  class SpinFetcher < Scraper

    def url_for_progress(n)
      "http://www.spin.com/news/?page=#{n}"
    end

    def headline_css_selector
      '.tout h5'
    end

  end
end
