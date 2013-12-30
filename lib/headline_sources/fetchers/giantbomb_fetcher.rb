require "headline_sources/scraper"

module HeadlineSources
  class GiantBombFetcher < Scraper

    def scrape_page(i)
      doc = Nokogiri::HTML(open("http://www.giantbomb.com/news/?page=#{i}"))
      doc.css('.editorial.river h3').each do |link|
        add_headline! link.content
      end
    end

  end
end