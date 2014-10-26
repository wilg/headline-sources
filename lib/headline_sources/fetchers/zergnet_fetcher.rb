require "headline_sources/scraper"
require 'json'
module HeadlineSources
  class ZergnetFetcher < Scraper

    def url_for_progress(n)
      "http://www.zergnet.com/ajax/load_results.php?queryString=%23%2F0%2F#{n}%2F0"
    end

    def headline_css_selector
      '.box-link .post-title'
    end

    def html_for_url(url)
      Nokogiri::XML(open(url)).at_xpath('.//middle').content
    end

  end
end
