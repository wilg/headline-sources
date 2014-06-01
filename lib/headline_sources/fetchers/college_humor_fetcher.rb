require "headline_sources/scraper"

module HeadlineSources
  class CollegeHumorFetcher < Scraper

    def url_for_progress(i)
      "http://www.collegehumor.com/articles/page:#{i}"
    end

    def headline_css_selector
      '.caption h3 a'
    end

    def is_date_only?(headline)
      date = Date.parse(headline)
      date.strftime("%B %e, %Y").squish == headline.squish
    rescue ArgumentError
      false
    end

    def is_valid?(headline)
      super && !is_date_only?(headline)
    end

    def excluded_matches
      [
      "CollegeHumor",
       "Issue #",
       ": Issue",
       ": Episode",
       "Caption Contest",
       "Live Show",
       "Staff Jokes",
       "Parents Just Don't Understand"
     ]
    end

  end
end
