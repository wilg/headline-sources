require "headline_sources/scraper"

module HeadlineSources
  class GuardianBlogsFetcher < Scraper

    def url_for_progress(i)
      "http://www.theguardian.com/news/blog?page=#{i}"
    end

    def headline_css_selector
      '#blog-posts-excerpts li h3 a'
    end

  end
end
