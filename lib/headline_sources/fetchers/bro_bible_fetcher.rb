require "headline_sources/scraper"

module HeadlineSources
  class BroBibleFetcher < Scraper

    def scrape_page_and_progress(i)
      doc = Nokogiri::HTML(open("http://www.brobible.com/P#{i}"))
      doc.css('.artDesc h3 a').each do |link|
        add_headline! link.content
      end
      return doc.css("#greatPaginate a.nextPage").first["href"].split("/P").last
    end
    
  end
end