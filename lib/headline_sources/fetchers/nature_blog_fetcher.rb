require "headline_sources/scraper"

module HeadlineSources
  class NatureBlogFetcher < Scraper

    def scrape_page(i)
      doc = Nokogiri::HTML(open("http://blogs.nature.com/news/page/#{i}"))
      doc.css('article h2 a').each do |link|
        add_headline! link.content
      end
    end

  end
end