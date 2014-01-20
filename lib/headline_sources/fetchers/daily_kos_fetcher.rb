require "headline_sources/scraper"

module HeadlineSources
  class DailyKosFetcher < Scraper

    def url_for_progress(n)
      "http://www.dailykos.com/main/#{n}/"
    end

    def headline_css_selector
      '.article .meta h2 a'
    end

  end
end