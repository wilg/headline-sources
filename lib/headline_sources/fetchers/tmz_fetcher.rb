require "headline_sources/scraper"

module HeadlineSources

  class TmzFetcher < RSSFetcher
    def feed_url
      %w[http://www.tmz.com/rss.xml
      http://www.tmz.com/category/celebrity-justice/rss.xml
      http://www.tmz.com/category/celebrity-feuds/rss.xml
      http://www.tmz.com/category/politix/rss.xml
      http://www.tmz.com/category/music/rss.xml
      http://www.tmz.com/category/movies/rss.xml
      http://www.tmz.com/category/tv/rss.xml
      http://www.tmz.com/category/TMZsports/rss.xml
      http://www.tmz.com/category/hook-ups/rss.xml
      http://www.tmz.com/category/beauty/rss.xml
      http://www.tmz.com/category/fashion/rss.xml
      http://www.tmz.com/category/gossip-rumors/rss.xml
      http://www.tmz.com/category/hot-mamas/rss.xml
      http://www.tmz.com/category/party-all-the-time/rss.xml
      http://www.tmz.com/category/ride-me/rss.xml
      http://www.tmz.com/category/stars-in-heat/rss.xml
      http://www.tmz.com/category/hot-vegas/rss.xml]
    end
  end

  class TmzFetcher2 < Scraper

    def scrape_page(i)
      doc = Nokogiri::HTML(open("http://www.tmz.com/page/#{i}/"))
      doc.css('article a.headline').each do |link|
        add_headline! Headline.new(link.content.gsub(/\s+/, ' ').chomp.strip)
      end
    end

  end
end
