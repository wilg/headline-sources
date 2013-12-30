require "headline_sources/fetcher"

module HeadlineSources
  class Scraper < Fetcher

    FAILURE_LIMIT = 3
    REPEAT_PAGE_LIMIT  = 5

    def perform_fetch!
      super
      @failure_count = 0
      @repeated_page_count = 0
      @progress = @progress || 0
      while true
        begin
          puts "Scraping page #{@progress} | #{new_headlines_this_run} new | #{@headlines.length} total".green

          page_start = @headlines.length
          @progress = scrape_page_and_progress(@progress)
          page_end = @headlines.length

          @repeated_page_count += 1 if page_end - page_start == 0

          write_file

          if @repeated_page_count == REPEAT_PAGE_LIMIT
            puts "#{REPEAT_PAGE_LIMIT} already fetched pages encountered, stopping.".red
            return
          end

        rescue => e
          @failure_count += 1
          puts "*** Failed on #{@progress} (#{@failure_count} / #{FAILURE_LIMIT})".red
          puts e.to_s
          return if @failure_count >= FAILURE_LIMIT
        end
      end
    end

    def scrape_page_and_progress(progress)
      scrape_page(progress)
      return progress + 1
    end

    def scrape_page(page_number)
      # add_headline! foo
    end

  end
end