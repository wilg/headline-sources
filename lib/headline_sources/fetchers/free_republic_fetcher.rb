require "headline_sources/scraper"

module HeadlineSources
  class FreeRepublicFetcher < Scraper

    def next_progress(progress)
      @nokogiri_document.css(".menus .pagination.menu a:last-child").first["href"].split("=").last
    end

    def url_for_progress(n)
      "http://freerepublic.com/tag/*/index?more=#{n}"
    end

    def headline_css_selector
      '.article h3 a'
    end

    def excluded_matches
      ['WEEKLY GARDEN THREAD', 'THREAD***', "Today's Toons", "Today's Word with"]
    end

  end
end