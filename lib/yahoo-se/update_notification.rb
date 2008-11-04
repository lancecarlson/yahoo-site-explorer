module Yahoo
  module SE
    # The Update Notification service allows you to notify Yahoo! when your site changes. You may notify us about a single page, or a set of pages that need attention.
    # 
    # update_notification = Yahoo::SE.update_notification("http://rubyskills.com")
    # 
    # page_data.response
    #
    # url: The URL of the page to be submitted, or the URL of a feed containing site data.
    def self.update_notification(url)
      Yahoo::SE::UpdateNotification.new(url)
    end
    
    class UpdateNotification
      SERVICE_PATH = "#{Yahoo::SE::SERVICE_PATH}/updateNotification"
      
      def initialize(url)
        @url = url
        @options = {}
        @options[:url] = url
        response
      end
      
      def response
        raise ApplicationIDNotSet if Yahoo::SE.application_id.nil?
        Yahoo::SE::Request.new(Yahoo::SE::UpdateNotification::SERVICE_PATH, @options).response
      end
    end
  end
end