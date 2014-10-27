require "headline_sources/scraper"

module HeadlineSources
  class NprFetcher < RSSFetcher

    def feed_url
      %w[
        http://www.npr.org/rss/rss.php?id=1001
        http://www.npr.org/rss/rss.php?id=100
        http://www.npr.org/rss/rss.php?id=1008
        http://www.npr.org/rss/rss.php?id=1006
        http://www.npr.org/rss/rss.php?id=1007
        http://www.npr.org/rss/rss.php?id=1057
        http://www.npr.org/rss/rss.php?id=1021
        http://www.npr.org/rss/rss.php?id=1012
        http://www.npr.org/rss/rss.php?id=1003
        http://www.npr.org/rss/rss.php?id=1004
        http://www.npr.org/rss/rss.php?id=2
        http://www.npr.org/rss/rss.php?id=37
        http://www.npr.org/rss/rss.php?id=3
        http://www.npr.org/rss/rss.php?id=5
        http://www.npr.org/rss/rss.php?id=13
        http://www.npr.org/rss/rss.php?id=46
        http://www.npr.org/rss/rss.php?id=7
        http://www.npr.org/rss/rss.php?id=10
        http://www.npr.org/rss/rss.php?id=216835831
        http://www.npr.org/rss/rss.php?id=43
        http://www.npr.org/rss/rss.php?id=1033
        http://www.npr.org/rss/rss.php?id=1032
        http://www.npr.org/rss/rss.php?id=1030
        http://www.npr.org/rss/rss.php?id=1013
        http://www.npr.org/rss/rss.php?id=1017
        http://www.npr.org/rss/rss.php?id=1025
        http://www.npr.org/rss/rss.php?id=1053
        http://www.npr.org/rss/rss.php?id=1052
        http://www.npr.org/rss/rss.php?id=1027
        http://www.npr.org/rss/rss.php?id=1022
        http://www.npr.org/rss/rss.php?id=1010
        http://www.npr.org/rss/rss.php?id=1070
        http://www.npr.org/rss/rss.php?id=1020
        http://www.npr.org/rss/rss.php?id=1009
        http://www.npr.org/rss/rss.php?id=1045
        http://www.npr.org/rss/rss.php?id=1039
        http://www.npr.org/rss/rss.php?id=1110
        http://www.npr.org/rss/rss.php?id=1109
        http://www.npr.org/rss/rss.php?id=1107
        http://www.npr.org/rss/rss.php?id=10003
        http://www.npr.org/rss/rss.php?id=10002
        http://www.npr.org/rss/rss.php?id=10001
        http://www.npr.org/rss/rss.php?id=10005
        http://www.npr.org/rss/rss.php?id=10004
        http://www.npr.org/rss/rss.php?id=1046
        http://www.npr.org/rss/rss.php?id=1018
        http://www.npr.org/rss/rss.php?id=1014
        http://www.npr.org/rss/rss.php?id=1048
        http://www.npr.org/rss/rss.php?id=1015
        http://www.npr.org/rss/rss.php?id=1016
        http://www.npr.org/rss/rss.php?id=1024
        http://www.npr.org/rss/rss.php?id=1026
        http://www.npr.org/rss/rss.php?id=1055
        http://www.npr.org/rss/rss.php?id=1050
        http://www.npr.org/rss/rss.php?id=1019
        http://www.npr.org/rss/rss.php?id=1047
        http://www.npr.org/rss/rss.php?id=1049
      ]
    end

  end
end
