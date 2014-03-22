require "headline_sources/scraper"

module HeadlineSources
  class McsweenysFetcher < Scraper

    def url_for_progress(n)
      "http://www.mcsweeneys.net/articles/archives?page=#{n}"
    end

    def headline_css_selector
      'a.coloredLink'
    end

  end
end
