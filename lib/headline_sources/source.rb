module HeadlineSources
  class Source

    attr_accessor :name, :default, :id, :category, :dead, :feeds, :rules

    def self.load_hash(hash)
      hash.map do |k, v|
        s = new
        s.id = k.to_sym
        s.name = v['name']
        s.feeds = ([v['rss_feeds']]).compact.flatten
        s.rules = ([v['rules']]).compact.flatten
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

      if feeds.length > 0
        rss_fetcher = RSSFetcher.new(*args)
        rss_fetcher.feeds = feeds
        rss_fetcher.preset_id = id
        fetchers << rss_fetcher
      end

      rules.each do |rule_hash|
        rule_scraper = RuleScraper.new(*args)
        rule_scraper.hash = rule_hash.with_indifferent_access
        fetchers << rule_scraper
      end

      i = 0
      while go == true
        begin
          require "headline_sources/fetchers/#{id}_fetcher"
          suffix = i == 0 ? '' : i + 1
          begin
            fetchers << "headline_sources/#{id}_fetcher#{suffix}".camelize.constantize.new(*args)
          rescue NameError
            go = false
          end
        rescue LoadError => e
          raise e unless fetchers.length > 0
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

    def as_json(*args)
      {
        id: id,
        name: name,
        category: category,
        default: default,
        dead: dead,
      }
    end

  end
end
