require 'active_record'

module HeadlineSources

  module DB
    class SourceHeadline < ActiveRecord::Base
    end
  end

  class ActiveRecordStore < Store

    def open
      ActiveRecord::Base.logger = Logger.new(STDERR)
      conn = ENV["DATABASE_URL"] || {
        adapter: "postgresql",
        encoding: "unicode",
        host: "localhost",
        database: "headlines_development"
      }
      ActiveRecord::Base.establish_connection(conn)
    end

    def close
      if (ActiveRecord::Base.connection && ActiveRecord::Base.connection.active?)
         ActiveRecord::Base.connection.close
      end
    end

  end
end
