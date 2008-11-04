module Yahoo
  module SE
    # Shows a list of all pages belonging to a domain in the Yahoo! index
    # 
    # page_data = Yahoo::SE.pages("http://rubyskills.com", :results => 100)
    # 
    # page_data.results 
    # 
    # page_data.next
    # 
    # page_data.results
    def self.pages(domain, options={})
      Yahoo::SE::Pages.new(domain, options)
    end
    
    class Pages
      SERVICE_PATH = "#{Yahoo::SE::SERVICE_PATH}/pageData"
      
      attr_reader :request
      
      def initialize(domain, options)
        @domain = domain
        @options = options
        @options[:query] = domain
        @options[:results] = @options[:results] ||= 50
        @options[:start] = @options[:start] ||= 1
      end
      
      # Displays the results for pages data
      def results
        raise ApplicationIDNotSet if Yahoo::SE.application_id.nil?
        @request = Yahoo::SE::Request.new(Yahoo::SE::Pages::SERVICE_PATH, @options)
        @request.results
      end
      
      # The response object from the request
      def response
        @request.response
      end
      
      # Reset the start option to the next results
      def next
        @options[:start] = @options[:start] + @options[:results]
        self
      end
    end
  end
end