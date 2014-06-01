require 'active_record'

module HeadlineSources

  module DB
    class SourceHeadline < ActiveRecord::Base
      validates :name_hash, uniqueness: {scope: :source_id}
    end
  end

  class ActiveRecordStore < Store

    def open!
      ActiveRecord::Base.logger = Logger.new(STDERR)
      conn = ENV["DATABASE_URL"] || {
        adapter: "postgresql",
        encoding: "unicode",
        host: "localhost",
        database: "headlines_development"
      }
      ActiveRecord::Base.establish_connection(conn)
    end

    def close!
      if (ActiveRecord::Base.connection && ActiveRecord::Base.connection.active?)
         ActiveRecord::Base.connection.close
      end
    end

    def add_headlines!(source_id, headlines)
      deduplicated = []
        headlines.uniq{|h| h.hash}.each do |h|
          begin
            headline = DB::SourceHeadline.new({
              name_hash:    h.hash,
              name:         h.name,
              url:          h.url,
              published_at: h.date,
              fetcher:      'headline-sources-active-record',
              source_id:    source_id,
              author:       h.author,
              section:      h.section,
            })
            headline.save!
            deduplicated << h
          rescue => e
            puts e.message.red
          end
        end
      deduplicated
    end

  end
end
