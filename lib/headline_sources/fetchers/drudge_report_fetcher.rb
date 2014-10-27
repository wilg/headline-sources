require "headline_sources/scraper"

module HeadlineSources
  class DrudgeReportFetcher < RSSFetcher
    def feed_url
      [
        "http://www.drudgereportarchives.com/rss/popular.xml",
        "http://www.drudgereportarchives.com/rss/recap.xml"
      ]
    end
  end
  class DrudgeReportFetcher2 < Scraper

    def url_for_progress(n)
      if n.to_i == 1
        "http://www.drudgereportarchives.com/dsp/links_recap.htm"
      else
        "http://www.drudgereportarchives.com/dsp/links_recap#{n}.htm"
      end
    end

    def headline_css_selector
      'center table div a[target=_top]'
    end

    def format_headline(headline)
      super(headline).gsub(/\.\.\.$/, '')
    end

  end
end
