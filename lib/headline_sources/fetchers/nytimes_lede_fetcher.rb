require "headline_sources/scraper"

module HeadlineSources
  class NytimesLedeFetcher < Scraper

    def url_for_progress(i)
      "http://thelede.blogs.nytimes.com/page/#{i}/"
    end

    def headline_css_selector
      'h3.entry-title a'
    end

  end
end
