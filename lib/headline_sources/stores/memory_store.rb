require "headline_sources/fetcher"

module HeadlineSources
  class MemoryStore < Store

    def current_contents(source_id)
      @memory ||= {}
      @memory[source_id] || []
    end

    def add_headlines!(source_id, headlines)
      @memory ||= {}
      contents = current_contents(source_id)
      @memory[source_id] = headlines.reject{|h| contents.include?(h.name)}
      @memory[source_id]
    end

  end
end
