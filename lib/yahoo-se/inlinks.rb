module Yahoo
  module SE
    # Shows the pages from other sites linking in to a page.
    # 
    # backlinks = Yahoo::SE.inlinks("http://rubyskills.com", :results => 100)
    # backlinks.results
    def self.inlinks(domain, options={})
      Yahoo::SE::Inlinks.new(domain, options)
    end
    
    class Inlinks
      SERVICE_PATH = "#{Yahoo::SE::SERVICE_PATH}/inlinkData"
      
      def initialize(domain, options)
        @domain = domain
        @options = options
        @options[:query] = domain
        results
      end
      
      # Displays the results for inlinks data
      def results
        Yahoo::SE::Request.new(Yahoo::SE::Inlinks::SERVICE_PATH, @options).results
      end
    end
  end
end