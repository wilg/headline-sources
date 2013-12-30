require "headline_sources/scraper"

module HeadlineSources
  class NypostFetcher < Scraper

    def scrape_page(i)
      doc = Nokogiri::HTML(open("http://nypost.com/news/page/#{i}/"))
      doc.css('.entry-header h3 a').each do |link|
        add_headline! link.content
      end
    end

  end
end