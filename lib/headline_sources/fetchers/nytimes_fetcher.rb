require "headline_sources/scraper"

module HeadlineSources
  class NytimesFetcher < RSSFetcher

    def feed_url
      %w[http://www.nytimes.com/services/xml/rss/nyt/HomePage.xml
http://www.nytimes.com/services/xml/rss/nyt/InternationalHome.xml
http://www.nytimes.com/services/xml/rss/nyt/World.xml
http://www.nytimes.com/services/xml/rss/nyt/Africa.xml
http://www.nytimes.com/services/xml/rss/nyt/Americas.xml
http://www.nytimes.com/services/xml/rss/nyt/AsiaPacific.xml
http://www.nytimes.com/services/xml/rss/nyt/Europe.xml
http://www.nytimes.com/services/xml/rss/nyt/MiddleEast.xml
http://www.nytimes.com/services/xml/rss/nyt/US.xml
http://www.nytimes.com/services/xml/rss/nyt/Education.xml
http://www.nytimes.com/services/xml/rss/nyt/Politics.xml
http://www.nytimes.com/services/xml/rss/nyt/Upshot.xml
http://www.nytimes.com/services/xml/rss/nyt/NYRegion.xml
http://www.nytimes.com/services/xml/rss/nyt/EnergyEnvironment.xml
http://www.nytimes.com/services/xml/rss/nyt/InternationalBusiness.xml
http://www.nytimes.com/services/xml/rss/nyt/SmallBusiness.xml
http://www.nytimes.com/services/xml/rss/nyt/Economy.xml
http://www.nytimes.com/services/xml/rss/nyt/MediaandAdvertising.xml
http://www.nytimes.com/services/xml/rss/nyt/YourMoney.xml
http://www.nytimes.com/services/xml/rss/nyt/PersonalTech.xml
http://www.nytimes.com/services/xml/rss/nyt/Sports.xml
http://www.nytimes.com/services/xml/rss/nyt/InternationalSports.xml
http://www.nytimes.com/services/xml/rss/nyt/Baseball.xml
http://www.nytimes.com/services/xml/rss/nyt/CollegeBasketball.xml
http://www.nytimes.com/services/xml/rss/nyt/CollegeFootball.xml
http://www.nytimes.com/services/xml/rss/nyt/Golf.xml
http://www.nytimes.com/services/xml/rss/nyt/Hockey.xml
http://www.nytimes.com/services/xml/rss/nyt/ProBasketball.xml
http://www.nytimes.com/services/xml/rss/nyt/ProFootball.xml
http://www.nytimes.com/services/xml/rss/nyt/Soccer.xml
http://www.nytimes.com/services/xml/rss/nyt/Tennis.xml
http://www.nytimes.com/services/xml/rss/nyt/Science.xml
http://www.nytimes.com/services/xml/rss/nyt/Environment.xml
http://www.nytimes.com/services/xml/rss/nyt/Space.xml
http://www.nytimes.com/services/xml/rss/nyt/Health.xml
http://www.nytimes.com/services/xml/rss/nyt/Research.xml
http://www.nytimes.com/services/xml/rss/nyt/Nutrition.xml
http://www.nytimes.com/services/xml/rss/nyt/HealthCarePolicy.xml
http://www.nytimes.com/services/xml/rss/nyt/Views.xml
http://www.nytimes.com/services/xml/rss/nyt/Arts.xml
http://www.nytimes.com/services/xml/rss/nyt/InternationalArts.xml
http://www.nytimes.com/services/xml/rss/nyt/ArtandDesign.xml
http://www.nytimes.com/services/xml/rss/nyt/Books.xml
http://www.nytimes.com/services/xml/rss/nyt/SundayBookReview.xml
http://www.nytimes.com/services/xml/rss/nyt/BestSellers.xml
http://www.nytimes.com/services/xml/rss/nyt/Dance.xml
http://www.nytimes.com/services/xml/rss/nyt/Movies.xml
http://www.nytimes.com/services/xml/rss/nyt/Music.xml
http://www.nytimes.com/services/xml/rss/nyt/Television.xml
http://www.nytimes.com/services/xml/rss/nyt/Theater.xml
http://www.nytimes.com/services/xml/rss/nyt/FashionandStyle.xml
http://www.nytimes.com/services/xml/rss/nyt/InternationalStyle.xml
http://www.nytimes.com/services/xml/rss/nyt/DiningandWine.xml
http://www.nytimes.com/services/xml/rss/nyt/InternationalDiningandWine.xml
http://www.nytimes.com/services/xml/rss/nyt/HomeandGarden.xml
http://www.nytimes.com/services/xml/rss/nyt/Weddings.xml
http://www.nytimes.com/services/xml/rss/nyt/tmagazine.xml
http://www.nytimes.com/services/xml/rss/nyt/Travel.xml
http://www.nytimes.com/services/xml/rss/nyt/JobMarket.xml
http://www.nytimes.com/services/xml/rss/nyt/RealEstate.xml
http://www.nytimes.com/services/xml/rss/nyt/Commercial.xml
http://www.nytimes.com/services/xml/rss/nyt/Automobiles.xml
http://www.nytimes.com/services/xml/rss/nyt/Obituaries.xml
http://www.nytimes.com/services/xml/rss/nyt/pop_top.xml
http://www.nytimes.com/services/xml/rss/nyt/MostShared.xml
http://www.nytimes.com/services/xml/rss/nyt/MostViewed.xml
http://www.nytimes.com/services/xml/rss/nyt/sunday-review.xml
http://www.nytimes.com/services/xml/rss/nyt/InternationalOpinion.xml
http://feeds.nytimes.com/nyt/rss/Business
http://feeds.nytimes.com/nyt/rss/Technology
http://topics.nytimes.com/top/features/travel/columns/frugal_traveler/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/columnists/charles_m_blow/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/columnists/davidbrooks/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/columnists/frankbruni/index.html?rss=1
http://topics.nytimes.com/top/news/international/columns/rogercohen/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/columnists/gailcollins/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/columnists/rossdouthat/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/columnists/maureendowd/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/columnists/thomaslfriedman/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/columnists/billkeller/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/columnists/nicholasdkristof/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/columnists/paulkrugman/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/columnists/joenocera/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/editorials/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/oped/contributors/index.html?rss=1
http://topics.nytimes.com/top/opinion/editorialsandoped/letters/index.html?rss=1]
    end

  end
end