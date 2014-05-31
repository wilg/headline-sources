require "headline_sources/fetcher"

module HeadlineSources
  class FileStore < Store

    def current_contents(source_id)
      if File.exists? dictionary_path(source_id)
        File.readlines(dictionary_path(source_id)).map{|l| l.chomp.strip}
      else
        []
      end
    end

    def dictionary_path(source_id)
      File.expand_path("../../../../db/#{source_id}.txt", __FILE__)
    end

    def add_headlines!(source_id, headlines)
      contents = current_contents(source_id)
      deduplicated = headlines.reject{|h| contents.include?(h.name)}
      if deduplicated.length > 0
        File.open(dictionary_path(source_id), 'a') do |f|
          f << "\n" unless contents.last.blank?
          f << deduplicated.map(&:name).join("\n")
          f << "\n"
        end
      end
      deduplicated
    end

  end
end
