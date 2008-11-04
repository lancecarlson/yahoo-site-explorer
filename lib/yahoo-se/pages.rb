module Yahoo
  module SE
    # Shows a list of all pages belonging to a domain in the Yahoo! index
    # 
    # page_data = Yahoo::SE.pages("http://rubyskills.com", :results => 100)
    # 
    # page_data.results 
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
      
      # Displays the results for pages data
      def results
        Yahoo::SE::Request.new(Yahoo::SE::Pages::SERVICE_PATH, @options).results
      end
    end
  end
end