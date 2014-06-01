require "headline_sources/scraper"

module HeadlineSources
  class UpworthyFetcher < Scraper

    def url_for_progress(i)
      "http://www.upworthy.com/page/#{i}"
    end

    def headline_css_selector
      '.nugget-info h3 a'
    end

  end
end
