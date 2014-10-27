require "headline_sources/scraper"

module HeadlineSources
  class PitchforkFetcher < RSSFetcher
    def feed_url
      %w[http://pitchfork.com/rss/reviews/albums/
        http://pitchfork.com/rss/reviews/tracks/
        http://pitchfork.com/rss/reviews/best/albums/
        http://pitchfork.com/rss/reviews/best/reissues/
        http://pitchfork.com/rss/reviews/best/tracks/
        http://pitchfork.com/rss/news/
        http://pitchfork.com/rss/thepitch/
        http://pitchfork.com/rss/tours/
        http://pitchfork.com/rss/features/]
    end
  end

  class PitchforkFetcher2 < Scraper

    def url_for_progress(n)
      "http://pitchfork.com/news/#{n}/"
    end

    def headline_css_selector
      'h1 a'
    end

  end
end
