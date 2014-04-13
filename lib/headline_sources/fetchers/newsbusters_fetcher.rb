require "headline_sources/scraper"

module HeadlineSources
  class NewsbustersFetcher < Scraper

    def url_for_progress(n)
      "http://newsbusters.org/archive?page=#{n}"
    end

    def headline_css_selector
      '.field-content h2.title'
    end

  end
end
