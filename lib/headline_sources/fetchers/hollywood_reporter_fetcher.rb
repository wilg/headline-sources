require "headline_sources/scraper"

module HeadlineSources
  class HollywoodReporterFetcher < RSSFetcher

    def feed_url
      [
        "http://feeds.feedburner.com/thr/news",
        "http://feeds.feedburner.com/thr/film",
        "http://feeds.feedburner.com/thr/television",
        "http://feeds.feedburner.com/thr/style",
        "http://feeds.feedburner.com/thr/international",
        "http://feeds.feedburner.com/thr/music",
        "http://feeds.feedburner.com/TheHollywoodReporter-Technology",
        "http://feeds.feedburner.com/thr/awards",
        "http://feeds.feedburner.com/thr/business",
        "http://feeds.feedburner.com/HollywoodReporterAsia",
        "http://feeds.feedburner.com/thr/labor",
        "http://feeds.feedburner.com/thr/boxoffice",
        "http://feeds.feedburner.com/thr/RealEstate",
        "http://feeds.feedburner.com/thr/politics",
        "http://feeds.feedburner.com/thr/reviews",
        "http://feeds.feedburner.com/asiareviewsRSS",
        "http://feeds.feedburner.com/live_feed",
        "http://feeds.feedburner.com/thr/riskybusiness",
        "http://feeds.feedburner.com/THRComicCon",
        "http://feeds.feedburner.com/THREsquire",
        "http://feeds.feedburner.com/HollywoodReporter-TheRace",
        "http://feeds.feedburner.com/thr/Earshot"
      ]
    end

  end
end
