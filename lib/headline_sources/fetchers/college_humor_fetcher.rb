require "headline_sources/scraper"

module HeadlineSources
  class CollegeHumorFetcher < Scraper

    def scrape_page(i)
      doc = Nokogiri::HTML(open("http://www.collegehumor.com/articles/page:#{i}"))
      doc.css('.caption h3 a').each do |link|
        add_headline! link.content
      end
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