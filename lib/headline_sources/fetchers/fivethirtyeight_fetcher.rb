module HeadlineSources
  class FivethirtyeightFetcher < RSSFetcher

    def feed_url
      [
        "http://fivethirtyeight.com/features/feed/",
        "http://fivethirtyeight.com/datalab/feed/",
        "http://fivethirtyeight.com/contributors/nate-silver/feed/",
        "http://fivethirtyeight.com/contributors/carl-bialik/feed/",
        "http://fivethirtyeight.com/contributors/ben-casselman/feed/",
        "http://fivethirtyeight.com/contributors/mona-chalabi/feed/",
        "http://fivethirtyeight.com/contributors/harry-enten/feed/",
        "http://fivethirtyeight.com/politics/feed/",
        "http://fivethirtyeight.com/economics/feed/",
        "http://fivethirtyeight.com/sports/feed/",
        "http://fivethirtyeight.com/science/feed/",
        "http://fivethirtyeight.com/life/feed/"
      ]
    end

  end
end
