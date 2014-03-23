require "headline_sources/scraper"
require 'json'
module HeadlineSources
  class MashableFetcher < Scraper

    def initial_progress
      [Time.now.year, 1]
    end

    def next_progress(progress)
      if @nokogiri_document.css("a.next_page").length > 0
        [progress[0], progress[1] + 1]
      else
        [progress[0] - 1, 1]
      end
    end

    def url_for_progress(n)
      "http://mashable.com/#{n[0]}/?page=#{n[1]}"
    end

    def headline_css_selector
      '.article-title a'
    end

  end
end
