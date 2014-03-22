require "headline_sources/scraper"

module HeadlineSources
  class BusinessInsiderFetcher < Scraper

    def url_for_progress(n)
      "http://www.businessinsider.com/?page=#{n}"
    end

    def headline_css_selector
      '.river h3 a'
    end

  end
end
