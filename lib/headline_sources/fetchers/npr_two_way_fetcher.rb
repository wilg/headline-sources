require "headline_sources/scraper"

module HeadlineSources
  class NprTwoWayFetcher < Scraper

    def url_for_progress(i)
      "http://www.npr.org/aggregation/103943429/storylist?page=#{i}&live=1"
    end

    def headline_css_selector
      'article h1 a'
    end

  end
end
