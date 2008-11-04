module Yahoo
  module SE
    def self.update_notification(domain)
      Yahoo::SE::UpdateNotification.new(domain)
    end
    
    class UpdateNotification
      SERVICE_PATH = "#{Yahoo::SE::SERVICE_PATH}/updateNotification"
      
      def initialize(domain)
        @domain = domain
        @options = {}
        @options[:url] = domain
        response
      end
      
      def response
        Yahoo::SE::Request.new(Yahoo::SE::UpdateNotification::SERVICE_PATH, @options).response
      end
    end
  end
end