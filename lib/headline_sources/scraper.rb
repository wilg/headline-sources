require "headline_sources/fetcher"

module HeadlineSources
  class Scraper < Fetcher

    def perform_partial_fetch!
      puts "Scraping page #{@progress} | #{new_headlines_this_run} new | #{@headlines.length} total".green
      @progress = initial_progress if @progress == 0
      @progress = scrape_page_and_progress(@progress)
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
      puts url.cyan
      @nokogiri_document = Nokogiri::HTML(open(url))
      @nokogiri_document.css(headline_css_selector).each do |link|
        add_headline! link.content
      end
    end

    # Override this
    def url_for_progress(n)
      nil
    end

    # Override this
    def headline_css_selector
      nil
    end

  end
end