require "headline_sources/scraper"

module HeadlineSources
  class BillboardFetcher < Scraper

    def url_for_progress(n)
      "http://www.billboard.com/articles?title=&page=#{n}"
    end

    def headline_css_selector
      '.content header h2 a'
    end

  end
end
