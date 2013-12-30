require "headline_sources/scraper"

module HeadlineSources
  class ThinkprogressFetcher < Scraper

    def scrape_page(i)
      doc = Nokogiri::HTML(open("http://thinkprogress.org/page/5#{i}/"))
      doc.css('.story-preview h4 a').each do |link|
        add_headline! link.content
      end
    end

  end
end