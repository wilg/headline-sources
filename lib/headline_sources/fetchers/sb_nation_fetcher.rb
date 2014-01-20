require "headline_sources/scraper"

module HeadlineSources
  class SbNationFetcher < Scraper

    def url_for_progress(n)
      "http://www.sbnation.com/latest-news/archives/#{n}/"
    end

    def headline_css_selector
      'header h3 a'
    end

  end
end