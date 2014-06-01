require "headline_sources/scraper"

module HeadlineSources
  class FaithItFetcher < Scraper

    def url_for_progress(i)
      "http://www.faithit.com/page/#{i}/"
    end

    def headline_css_selector
      '.thumbnail a.title'
    end

  end
end
