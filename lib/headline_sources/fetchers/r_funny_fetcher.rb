require "headline_sources/reddit_fetcher"

module HeadlineSources
  class RFunnyFetcher < RedditFetcher

    def subreddit
      'funny'
    end

  end
end