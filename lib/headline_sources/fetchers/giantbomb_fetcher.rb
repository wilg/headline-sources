require "headline_sources/scraper"

module HeadlineSources
  class GiantbombFetcher < Scraper

    def url_for_progress(n)
      "http://www.giantbomb.com/news/?page=#{n}"
    end

    def headline_css_selector
      '.editorial.river h3'
    end

    def excluded_matches
      [
        "Ryan Davis, 1979 - 2013",
        "Top 10",
        "s Top",
        "Game of the Year Awards",
        "Giant Bomb's"
      ]
    end

  end
end