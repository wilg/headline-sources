require "headline_sources/scraper"

module HeadlineSources
  class BroBibleFetcher < Scraper

    def url_for_progress(n)
      "http://www.brobible.com/page/#{n}/"
    end

    def headline_css_selector
      '.post-title h2 a'
    end

  end
end
