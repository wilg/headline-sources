require "headline_sources/scraper"

module HeadlineSources

  module ChiveExclusions

    def format_headline(headline)
      super(headline).gsub(/\((.+)\)/, '').gsub("….", "")
    end

    def excluded_matches
      [
        "Chive",
        "CHIVE",
        "Daily Afternoon",
        "Daily Morning"
      ]
    end

  end

  class TheChiveFetcher < RSSFetcher

    include ChiveExclusions

    def feed_url
      "http://thechive.com/feed/"
    end

  end

end
