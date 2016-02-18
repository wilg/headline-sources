require "headline_sources/scraper"

module HeadlineSources
  class RuleScraper < Scraper

    attr_accessor :hash

    def url_for_progress(n)
      return if n > 1 && !hash[:url].include?("{{n}}")
      hash[:url].gsub("{{n}}", n.to_s)
    end

    def headline_css_selector
      hash[:selector]
    end

    def headline_text_selector
      hash[:text_selector]
    end

    def headline_href_prefix
      hash[:href_prefix]
    end

  end
end
