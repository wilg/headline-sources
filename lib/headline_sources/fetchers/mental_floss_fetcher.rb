require "headline_sources/scraper"
require 'json'
module HeadlineSources
  class MentalFlossFetcher < Scraper

    def url_for_progress(n)
      "http://www.mentalfloss.com/load_more/get_page/section?page=#{n}"
    end

    def headline_css_selector
      '.views-row h1 a'
    end

    def html_for_url(url)
      data = nil
      open(url) { |io| data = io.read }
      JSON.parse(data)['data']
    end

  end
end
