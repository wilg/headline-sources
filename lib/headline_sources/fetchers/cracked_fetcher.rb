require "headline_sources/scraper"

module HeadlineSources
  class CrackedFetcher < RSSFetcher
    def feed_url
      "http://feeds.feedburner.com/CrackedRSS"
    end
  end
  class CrackedFetcher2 < Scraper

    def url_for_progress(n)
      "http://www.cracked.com/past_featured_ajax/?page=#{n}&ajax=true"
    end

    def headline_css_selector
      'h3 a'
    end

  end
end
