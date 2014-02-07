require "headline_sources/scraper"

module HeadlineSources
  class GawkerFetcher < Scraper

    def gawker_domain
      "gawker.com"
    end

  	def initial_progress
  	  0
  	end

    def next_progress(progress)
      [try_for_href("a.load-more-link"), try_for_href(".row.load-more .mbx.text-center a")].compact.first
    end

    def try_for_href(selector)
      @nokogiri_document.css(selector).first["href"].split("=").last
    rescue
      nil
    end

    def url_for_progress(i)
      "http://#{gawker_domain}/?startTime=#{i}"
    end

    def headline_css_selector
      '.headline a'
    end

  end
end