require "open-uri"
require "json"

module Yahoo
  module SE
    class Request
      def self.hash_to_query(hash)
        hash.map {|key, value| "#{key}=#{value}"}.join("&")
      end
    
      def initialize(service_path, options)
        @service_path = service_path
        @options = options
        @options[:appid] = Yahoo::SE.application_id
        @options[:output] = "json"
        @query_string = self.class.hash_to_query(@options)
      end
    
      def path
        "#{@service_path}?#{@query_string}"
      end
      
      def result_body
        open(path).readlines.join
      end
      
      def results
        Yahoo::SE::Result.new(result_body)
      end
    end
  end
end