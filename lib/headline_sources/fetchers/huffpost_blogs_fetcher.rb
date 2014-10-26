require "headline_sources/scraper"

module HeadlineSources
  class HuffpostBlogsFetcher < RSSFetcher

    def feed_url
      [
        "http://www.huffingtonpost.com/feeds/index.xml",
        "http://www.huffingtonpost.com/feeds/news.xml",
        "http://www.huffingtonpost.com/feeds/blog.xml"
      ]
    end

  end
end
