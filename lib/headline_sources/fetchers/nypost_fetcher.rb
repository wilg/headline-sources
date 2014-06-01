require "headline_sources/scraper"

module HeadlineSources
  class NypostFetcher < Scraper

    def url_for_progress(i)
      "http://nypost.com/news/page/#{i}/"
    end

    def headline_css_selector
      '.entry-header h3 a'
    end

  end
end
