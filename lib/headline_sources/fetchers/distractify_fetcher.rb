require "headline_sources/scraper"
require 'json'
module HeadlineSources
  class DistractifyFetcher < Scraper

    def url_for_progress(n)
      "http://distractify.com/page/#{n}/"
    end

    def headline_css_selector
      '.post-details-header span'
    end

  end
end
