require "headline_sources/scraper"

module HeadlineSources
  class GiantbombFetcher < RSSFetcher

    def feed_url
      "http://www.giantbomb.com/feeds/mashup/"
    end

    def excluded_matches
      [
        "Worth Reading",
        "Worth Playing",
        "Ryan Davis, 1979 - 2013",
        "Top 10",
        "s Top",
        "Game of the Year Awards",
        "Giant Bomb's"
      ]
    end

  end
end
