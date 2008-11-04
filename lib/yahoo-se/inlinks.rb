module Yahoo
  module SE
    # Shows the pages from other sites linking in to a page.
    # 
    # backlinks = Yahoo::SE.inlinks("http://rubyskills.com", :results => 100)
    # 
    # backlinks.results
    # 
    # backlinks.next
    # 
    # backlinks.results
    def self.inlinks(domain, options={})
      Yahoo::SE::Inlinks.new(domain, options)
    end
    
    class Inlinks
      SERVICE_PATH = "#{Yahoo::SE::SERVICE_PATH}/inlinkData"
      
      attr_reader :request
      
      def initialize(domain, options)
        @domain = domain
        @options = options
        @options[:query] = domain
        @options[:results] = @options[:results] ||= 50
        @options[:start] = @options[:start] ||= 1
      end
      
      # Displays the results for inlinks data
      def results
        raise ApplicationIDNotSet if Yahoo::SE.application_id.nil?
        @request = Yahoo::SE::Request.new(Yahoo::SE::Inlinks::SERVICE_PATH, @options)
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