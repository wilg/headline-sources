require "headline_sources/scraper"

module HeadlineSources
  class HackernewsFetcher < Scraper

    def initial_progress
      Date.today
    end

    def next_progress(progress)
      progress.prev_day
    end

    def url_for_progress(i)
      "http://www.daemonology.net/hn-daily/#{i.year}-#{'%02i' % i.month}-#{'%02i' % i.day}.html"
    end

    def headline_css_selector
      '.storylink a'
    end

  end
end