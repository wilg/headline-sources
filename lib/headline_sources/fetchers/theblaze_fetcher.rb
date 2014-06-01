require "headline_sources/scraper"

module HeadlineSources
  class TheblazeFetcher < Scraper

    def url_for_progress(i)
      "http://www.theblaze.com/stories/page/#{i}/"
    end

    def headline_css_selector
      '.story.blog-post h5'
    end

  end
end
