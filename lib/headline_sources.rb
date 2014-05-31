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
  require "headline_sources/rss_fetcher"

  # Stores
  require "headline_sources/stores/store"
  require "headline_sources/stores/file_store"
  require "headline_sources/stores/active_record_store"

end
