require "headline_sources/scraper"

module HeadlineSources
  class WiredFetcher < RSSFetcher

    def feed_url
      [
        'http://feeds.wired.com/wired/index',
        'http://feeds.wired.com/wiredautopia',
        'http://feeds.wired.com/WiredReviews',
        'http://feeds.wired.com/howtowiki',
        'http://feeds.wired.com/wiredbusinessblog',
        'http://feeds.wired.com/WiredDangerRoom',
        'http://feeds.wired.com/GearFactor',
        'http://feeds.wired.com/Gamelife',
        'http://feeds.wired.com/wiredgeekmom/',
        'http://feeds.wired.com/wiredinsights',
        'http://feeds.wired.com/wiredopinion/',
        'http://feeds.wired.com/wiredplaybook/',
        'http://feeds.wired.com/RawFile',
        'http://feeds.wired.com/ThisDayInTech',
        'http://feeds.wired.com/wired27b',
        'http://feeds.wired.com/wiredunderwire',
        'http://feeds.wired.com/wired/design',
        'http://feeds.wired.com/wiredenterprise/',
        'http://feeds.wired.com/wiredscience',
        'http://feeds.wired.com/wiredscienceblogs/',
      ]
    end

  end
end
