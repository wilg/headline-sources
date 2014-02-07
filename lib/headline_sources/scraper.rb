require "headline_sources/fetcher"

module HeadlineSources
  class Scraper < Fetcher

    def perform_partial_fetch!
      puts "#{@progress}   |   #{new_headlines_this_run} new   |   #{formatted_headlines.length} total"
      @progress = initial_progress if @progress == 0
      @progress = scrape_page_and_progress(@progress)
    rescue
      @progress = next_progress(@progress)
      raise "Error while fetching"
    end

    def scrape_page_and_progress(progress)
      scrape_page(progress)
      return next_progress(progress)
    end

    def initial_progress
      1
    end

    def next_progress(progress)
      progress + 1
    end

    # Override this or override url_for_progress and headline_css_selector
    def scrape_page(progress)
      url = url_for_progress(progress)
      # puts url.cyan
      @nokogiri_document = Nokogiri::HTML(open(url))
      @nokogiri_document.css(headline_css_selector).each do |link|
        add_headline! link.content
      end
    end

    # Override this
    def url_for_progress(n)
      raise "Scraper not subclassed correctly"
    end

    # Override this
    def headline_css_selector
      raise "Scraper not subclassed correctly"
    end

  end
end