require "headline_sources/scraper"

module HeadlineSources
  class TestedFetcher < Scraper

    def scrape_page(i)
      doc = Nokogiri::HTML(open("http://www.tested.com/?&p=#{i}"))
      doc.css('article header a.title').each do |link|
        add_headline! link.content
      end
    end

    def excluded_matches
      [
        "The Inventern",
        "This Is Only a Test",
        "Tour Bus Diaries",
        "Episode",
        "Totally Unauthorized Commentary",
        "Tested"
      ]
    end

  end
end