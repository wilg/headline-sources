require "headline_sources/scraper"

module HeadlineSources
  class TheblazeFetcher < RSSFetcher
    def feed_url
      ["http://www.theblaze.com/stories/feed/", "http://www.theblaze.com/feed/"]
    end
  end
  class TheblazeFetcher2 < Scraper

    def url_for_progress(i)
      "http://www.theblaze.com/stories/page/#{i}/"
    end

    def headline_css_selector
      '.story.blog-post h5'
    end

  end
end
