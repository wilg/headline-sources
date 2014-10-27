require "headline_sources/scraper"

module HeadlineSources
  class ThinkprogressFetcher < RSSFetcher
    def feed_url
      "http://thinkprogress.org/feed/"
    end
  end
  class ThinkprogressFetcher2 < Scraper

    def url_for_progress(i)
      "http://thinkprogress.org/page/5#{i}/"
    end

    def headline_css_selector
      '.story-preview h4 a'
    end

  end
end
