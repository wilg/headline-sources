require "headline_sources/scraper"

module HeadlineSources
  class CnsNewsFetcher < Scraper

    def url_for_progress(n)
      "http://www.cnsnews.com/blog/archive?page=#{n}"
    end

    def headline_css_selector
      '.views-field-title .field-content a'
    end

  end
end