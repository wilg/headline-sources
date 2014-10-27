require "headline_sources/scraper"

module HeadlineSources
  class DaringfireballFetcher < RSSFetcher
    def feed_url
      "http://daringfireball.net/feeds/main"
    end
  end
  class DaringfireballFetcher2 < Scraper

    def initial_progress
      Date.today
    end

    def next_progress(progress)
      progress.prev_month
    end

    def url_for_progress(n)
      "http://daringfireball.net/linked/#{n.year}/#{Date::MONTHNAMES[n.month].downcase}"
    end

    def headline_css_selector
      'dt a'
    end

  end
end
