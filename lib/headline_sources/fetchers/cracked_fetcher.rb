require "headline_sources/scraper"

module HeadlineSources
  class CrackedFetcher < Scraper

    def url_for_progress(n)
      "http://www.cracked.com/past_featured_ajax/?page=#{n}&ajax=true"
    end

    def headline_css_selector
      'h3 a'
    end

  end
end
