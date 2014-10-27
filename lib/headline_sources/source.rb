module HeadlineSources
  class Source

    attr_accessor :name, :default, :id, :category, :dead

    def self.load_hash(hash)
      hash.map do |k, v|
        s = new
        s.id = k.to_sym
        s.name = v['name']
        s.category = v['category']
        s.default = !!v['default']
        s.dead = !!v['dead']
        s
      end
    end

    def self.find_all(ids)
      ids.map{|id| find(id) }.compact
    end

    def self.find(id)
      all.find{|source| source.id == id.to_sym}
    end

    def self.categories
      all.sort_by{|s| s.category}.group_by{|s| s.category }
    end

    @@all_sources = nil
    def self.all
      @@all_sources ||= load_hash(YAML.load_file(File.expand_path("../../../db/sources.yml", __FILE__)))
    end

    def fetchers(*args)
      go = true
      fetchers = []
      i = 0
      while go == true
        require "headline_sources/fetchers/#{id}_fetcher"
        suffix = i == 0 ? '' : i + 1
        begin
          fetchers << "headline_sources/#{id}_fetcher#{suffix}".camelize.constantize.new(*args)
        rescue NameError
          go = false
        end
        i += 1
      end
      fetchers
    end

    def hash
      id.hash
    end

    def eql?(other)
      id.eql?(other)
    end

  end
end
