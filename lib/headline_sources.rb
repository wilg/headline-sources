require "headline_sources/version"
require "headline_sources/source"

if defined?(Rails)
  # Just run as an engine to serve assets
  require "headline_sources/rails"
else
  # We'll want to do some scraping

  require "headline_sources/headline"

  # Base Fetchers
  require "headline_sources/fetcher"
  require "headline_sources/reddit_fetcher"
  require "headline_sources/scraper"
  require "headline_sources/rule_scraper"
  require "headline_sources/rss_fetcher"

  # Stores
  require "headline_sources/stores/store"
  require "headline_sources/stores/file_store"
  require "headline_sources/stores/active_record_store"
  require "headline_sources/stores/memory_store"

end

# https://github.com/feedjira/feedjira/issues/380
module Feedjira
  class Feed
    class << self
      def parse_last_modified(response)
        lm = response.headers['last-modified']
        DateTime.parse(lm).to_time unless lm.to_s.empty?
      rescue StandardError => e
        Feedjira.logger.warn { "Failed to parse last modified '#{lm}'" }
        Feedjira.logger.debug(e)
        nil
      end
    end
  end
end
