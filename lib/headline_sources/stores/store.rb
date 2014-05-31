require "headline_sources/fetcher"

module HeadlineSources
  class Store

    def add_headlines!(source_id, headlines)
      raise "Not implemented"
    end

    def exists?(source_id, headline)
      raise "Not implemented"
    end

  end
end
