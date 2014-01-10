require "headline_sources/scraper"

module HeadlineSources
  class HuffpostBlogsFetcher < Scraper

    def initial_progress
      Date.today
    end

    def next_progress(progress)
      progress.prev_day
    end

    def url_for_progress(i)
      "http://www.huffingtonpost.com/politics/the-blog/#{i.strftime("%Y/%m/%d")}/"
    end

    def headline_css_selector
      '.entry_right h3 a'
    end

  end
end