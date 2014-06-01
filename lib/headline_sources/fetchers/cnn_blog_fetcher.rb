require "headline_sources/scraper"

module HeadlineSources
  class CnnBlogFetcher < Scraper

    def url_for_progress(i)
      "http://news.blogs.cnn.com/page/#{i}/"
    end

    def headline_css_selector
      '.cnnBlogContentTitle a'
    end

  end
end
