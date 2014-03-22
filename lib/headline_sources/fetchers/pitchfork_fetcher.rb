require "headline_sources/scraper"

module HeadlineSources
  class PitchforkFetcher < Scraper

    def url_for_progress(n)
      "http://pitchfork.com/news/#{n}/"
    end

    def headline_css_selector
      'h1 a'
    end

  end
end
