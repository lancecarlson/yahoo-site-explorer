module Yahoo
  module SE
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
      
      def results
        Yahoo::SE::Request.new(Yahoo::SE::Inlinks::SERVICE_PATH, @options).results
      end
    end
  end
end