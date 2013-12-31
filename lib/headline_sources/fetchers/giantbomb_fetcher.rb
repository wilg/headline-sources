require "headline_sources/scraper"

module HeadlineSources
  class GiantbombFetcher < Scraper

    def scrape_page(i)
      doc = Nokogiri::HTML(open("http://www.giantbomb.com/news/?page=#{i}"))
      doc.css('.editorial.river h3').each do |link|
        add_headline! link.content
      end
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