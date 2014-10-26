require "headline_sources/scraper"
require 'json'
module HeadlineSources
  class DistractifyFetcher < Scraper

    def url_for_progress(n)
      "http://news.distractify.com/site/list/skip/#{(n - 1) * 100}/limit/100"
    end

    def headline_css_selector
      '.post-item h3 a'
    end

  end
end
