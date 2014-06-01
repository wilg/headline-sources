require "headline_sources/scraper"

module HeadlineSources
  class TheChiveFetcher < Scraper

    def url_for_progress(i)
      "http://thechive.com/page/#{i}/"
    end

    def headline_css_selector
      'h2.post-title a'
    end

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
end
