module Yahoo
  module SE
    # Shows the pages from other sites linking in to a page.
    # 
    # backlinks = Yahoo::SE.inlinks("http://rubyskills.com", :results => 100)
    # 
    # backlinks.results
    # 
    # backlinks.next
    def self.inlinks(domain, options={})
      Yahoo::SE::Inlinks.new(domain, options)
    end
    
    class Inlinks
      include Yahoo::SE::Paginator
      SERVICE_PATH = "#{Yahoo::SE::SERVICE_PATH}/inlinkData"
      
      attr_reader :request
      attr_accessor :options
      
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
        @results = @request.results
      end
    end
  end
end