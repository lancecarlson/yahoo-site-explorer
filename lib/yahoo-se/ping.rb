module Yahoo
  module SE
    def self.ping(domain)
      Yahoo::SE::Ping.new(domain)
    end
    
    class Ping
      SERVICE_PATH = "#{Yahoo::SE::SERVICE_PATH}/ping"
      
      def initialize(domain)
        @domain = domain
        @options = {}
        @options[:sitemap] = domain
        response
      end
      
      def response
        Yahoo::SE::Request.new(Yahoo::SE::Ping::SERVICE_PATH, @options).response
      end
    end
  end
end