require "headline_sources/fetcher"

module HeadlineSources
  class Scraper < Fetcher

    def perform_partial_fetch!
      puts "#{@progress}   |   #{new_headlines_this_run} new   |   #{@dup_count} dups"
      @progress = initial_progress if @progress == 0
      @progress = scrape_page_and_progress(@progress)
    rescue Exception => e
      @progress = next_progress(@progress)
      raise e
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

    def html_for_url(url)
      open(url, http_headers)
    end

    def http_headers
      {'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36'}
    end

    # Override this or override url_for_progress and headline_css_selector
    def scrape_page(progress)
      url = url_for_progress(progress)
      unless url
        puts "Scraper has no more pages.".red
        return
      end
      puts url.cyan
      @nokogiri_document = Nokogiri::HTML(html_for_url(url))
      @nokogiri_document.css(headline_css_selector).each do |link|

        name = link.content
        if headline_text_selector
          text_element = link.css(headline_text_selector).first
          if text_element && text_element.content
            name = text_element.content
          end
        end

        h = Headline.new(name)
        h.url = if link['href']
          if link['href'].start_with?("http")
            link['href']
          elsif headline_href_prefix
            "#{headline_href_prefix}#{link['href']}"
          else
            nil
          end
        else
          nil
        end
        add_headline! h
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

    def headline_href_prefix
      nil
    end

    def headline_text_selector
      nil
    end

  end
end
