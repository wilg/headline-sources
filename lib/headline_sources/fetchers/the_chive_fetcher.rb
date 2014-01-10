require "headline_sources/scraper"

module HeadlineSources
  class TheChiveFetcher < Scraper

    def scrape_page(i)
      doc = Nokogiri::HTML(open("http://thechive.com/page/#{i}/"))
      doc.css('h2.post-title a').each do |link|
        add_headline! link.content
      end
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