require "open-uri"
require "json"

module Yahoo
  module SE
    class Request
      
      # Converts a hash to a query string
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
    
      # The API URL call
      def path
        "#{@service_path}?#{@query_string}"
      end
      
      # The response object of the request
      def response
        @response = @response ||= Yahoo::SE::Response.new(response_body)
      end
      
      # The response body of the request
      def response_body
        open(path).readlines.join
      end
      
      # The results from the response object
      def results
        response.results
      end
    end
  end
end