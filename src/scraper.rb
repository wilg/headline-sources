require_relative 'fetcher'

class Scraper < Fetcher

  FAILURE_LIMIT = 3

  def fetch!
    super
    @failure_count = 0
    @progress = @progress || 0
    while true
      begin
        puts "Scraping page #{@progress} | #{new_headlines_this_run} new | #{@headlines.length} total".green
        @progress = scrape_page_and_progress(@progress)
        write_file
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