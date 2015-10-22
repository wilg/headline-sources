require "headline_sources/scraper"
require 'json'
module HeadlineSources
  class DistractifyFetcher < Scraper

    def url_for_progress(n)
      [
        "http://distractify.com/",
        "http://distractify.com/trending",
        "http://distractify.com/entertainment",
        "http://distractify.com/fyi",
        "http://distractify.com/sex-relationships",
        "http://distractify.com/food",
        "http://distractify.com/videos",
      ][n - 1]
    end

    def headline_css_selector
      '.index-feed__title'
    end

    def headline_href_prefix
      "http://distractify.com"
    end

  end
end
