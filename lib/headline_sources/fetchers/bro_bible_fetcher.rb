require "headline_sources/scraper"

module HeadlineSources
  class BroBibleFetcher < Scraper

    def initial_progress
      0
    end

    def next_progress(progress)
      @nokogiri_document.css("#greatPaginate a.nextPage").first["href"].split("/P").last
    end

    def url_for_progress(i)
      "http://www.brobible.com/P#{i}"
    end

    def headline_css_selector
      '.artDesc h3 a'
    end
    
  end
end