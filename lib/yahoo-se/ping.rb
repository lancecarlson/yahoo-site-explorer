module Yahoo
  module SE
    # Allows you to notify Yahoo! of changes to your site. No appid required
    # 
    # ping = Yahoo::SE.pages("http://rubyskills.com")
    # 
    # ping.response
    # 
    # sitemap: The URL of the page to be submitted, or the URL of a feed containing site data.
    def self.ping(sitemap)
      Yahoo::SE::Ping.new(sitemap)
    end
    
    class Ping
      SERVICE_PATH = "#{Yahoo::SE::SERVICE_PATH}/ping"
      
      def initialize(sitemap)
        @sitemap = sitemap
        @options = {}
        @options[:sitemap] = sitemap
        response
      end
      
      def response
        Yahoo::SE::Request.new(Yahoo::SE::Ping::SERVICE_PATH, @options).response
      end
    end
  end
end