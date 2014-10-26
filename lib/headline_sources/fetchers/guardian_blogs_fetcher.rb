require "headline_sources/scraper"

module HeadlineSources

  class GuardianBlogsFetcher < RSSFetcher
    def feed_url
      ["http://www.theguardian.com/uk/rss", "http://www.theguardian.com/us/rss"]
    end
  end

  class GuardianBlogsFetcher2 < Scraper

    def url_for_progress(i)
      "http://www.theguardian.com/news/blog?page=#{i}"
    end

    def headline_css_selector
      '#blog-posts-excerpts li h3 a'
    end

  end
end
