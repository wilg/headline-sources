require "headline_sources/scraper"

module HeadlineSources

  class NewsbustersFetcher < RSSFetcher
    def feed_url
      "http://newsbusters.org/blog/feed"
    end
  end

  class NewsbustersFetcher2 < Scraper

    def url_for_progress(n)
      "http://newsbusters.org/more-posts?page=#{n}"
    end

    def headline_css_selector
      '.views-row .views-field-title a'
    end

  end

end
