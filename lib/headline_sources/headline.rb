module HeadlineSources
  class Headline

    attr_accessor :name, :url, :date

    def self.headline_hash(name)
      name.parameterize.gsub('-', '')
    end

    def initialize(name)
      @name = name
    end

    def hash
      self.class.headline_hash(@name)
    end

  end
end
