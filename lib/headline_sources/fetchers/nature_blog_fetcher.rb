require "headline_sources/scraper"

module HeadlineSources
  class NatureBlogFetcher < Scraper

    def url_for_progress(i)
      "http://blogs.nature.com/news/page/#{i}"
    end

    def headline_css_selector
      'article h2 a'
    end

  end
end
