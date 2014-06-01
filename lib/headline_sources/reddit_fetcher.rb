require "headline_sources/fetcher"
require 'snoo'

module HeadlineSources
  class RedditFetcher < Fetcher

    def subreddit
      ''
    end

    def perform_fetch!
      @reddit = Snoo::Client.new
      super
    end

    def perform_partial_fetch!
      puts "Scraping listing after #{@progress} | #{@headlines.length} headlines found"
      listing = @reddit.get_listing(subreddit: subreddit, t: 'all', page: 'top', sort: 'top', limit: 100, after: @progress)
      listing['data']['children'].each do |item|
        add_headline! Headline.new(item['data']['title'])
        @progress = item['data']['name']
      end
    end

  end
end
