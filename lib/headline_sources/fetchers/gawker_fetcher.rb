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
      @nokogiri_document.css("a.load-more-link").first["href"].split("=").last
    end

    def url_for_progress(i)
      "http://#{gawker_domain}/?startTime=#{i}"
    end

    def headline_css_selector
      '.headline a'
    end

  end
end