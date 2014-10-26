require "headline_sources/scraper"

module HeadlineSources

  class HitfixFetcher < RSSFetcher

    def feed_url
      "http://www.hitfix.com/headlines.rss"
    end

  end

  class HitfixFetcher2 < Scraper

    def url_for_progress(n)
      "http://www.hitfix.com/archive/all/?id=all&page=#{n}"
    end

    def headline_css_selector
      '.listing .details h2'
    end

  end
end
