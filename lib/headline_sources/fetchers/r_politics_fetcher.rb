require "headline_sources/reddit_fetcher"

module HeadlineSources
  class RPoliticsFetcher < RedditFetcher

    def subreddit
      'politics'
    end

  end
end