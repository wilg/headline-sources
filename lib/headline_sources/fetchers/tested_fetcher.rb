require "headline_sources/scraper"

module HeadlineSources
  class TestedFetcher < Scraper

    def url_for_progress(i)
      "http://www.tested.com/?&p=#{i}"
    end

    def headline_css_selector
      'article header a.title'
    end

    def excluded_matches
      [
        "The Inventern",
        "This Is Only a Test",
        "This is Only a Test",
        "Tour Bus Diaries",
        "Episode",
        "OCTOBERKAST",
        "Still Untitled",
        "The Amazing Test",
        "The As Yet Untitled",
        "Totally Unauthorized Commentary",
        "Tested"
      ]
    end

  end
end
