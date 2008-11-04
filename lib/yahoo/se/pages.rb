module Yahoo
  module SE
    def self.pages(domain, options={})
      Yahoo::SE::Pages.new(domain, options)
    end
    
    class Pages
      SERVICE_PATH = "#{Yahoo::SE::SERVICE_PATH}/pageData"
      
      def initialize(domain, options)
        @domain = domain
        @options = options
        @options[:query] = domain
        results
      end
      
      def results
        Yahoo::SE::Request.new(Yahoo::SE::Pages::SERVICE_PATH, @options).results
      end
    end
  end
end