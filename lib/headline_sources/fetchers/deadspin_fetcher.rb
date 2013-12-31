require "headline_sources/scraper"

module HeadlineSources
  class DeadspinFetcher < Scraper

    def scrape_page_and_progress(progress)
      doc = Nokogiri::HTML(open("http://deadspin.com/?startTime=#{progress}"))
      doc.css('.headline a').each do |link|
        add_headline! link.content
      end
      return doc.css("a.load-more-link").first["href"].split("=").last
    end

  end
end