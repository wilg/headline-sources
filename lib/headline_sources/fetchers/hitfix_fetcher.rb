require "headline_sources/scraper"

module HeadlineSources
  class HitfixFetcher < Scraper

    def url_for_progress(n)
      "http://www.hitfix.com/archive/all/?id=all&page=#{n}"
    end

    def headline_css_selector
      '.article-head h2 a'
    end

  end
end
