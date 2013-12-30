require_relative '../scraper'

class FaithItFetcher < Scraper

  def scrape_page(i)
    doc = Nokogiri::HTML(open("http://www.faithit.com/page/#{i}/"))
    doc.css('.thumbnail a.title').each do |link|
      add_headline! link.content
    end
  end

end

FaithItFetcher.new.fetch!