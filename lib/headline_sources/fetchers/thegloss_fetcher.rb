require "headline_sources/scraper"

module HeadlineSources
  class TheglossFetcher < Scraper

    def url_for_progress(n)
      "http://www.thegloss.com/page/#{n}/"
    end

    def headline_css_selector
      'h2.entry-title a'
    end

  end
end
