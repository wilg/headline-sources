require "headline_sources/scraper"

module HeadlineSources
  class PolygonFetcher < RSSFetcher
    def feed_url
      "http://www.polygon.com/rss/index.xml"
    end
  end
  class PolygonFetcher2 < Scraper

    def url_for_progress(n)
      "http://www.polygon.com/polygon_groups/infinite_scroll/3447/#{n}/"
    end

    def headline_css_selector
      '.block .meta h2 a'
    end

  end
end
