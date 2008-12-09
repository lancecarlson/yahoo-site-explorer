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
        @response ||= Yahoo::SE::Response.new(response_body)
      end
      
      # The response body of the request
      def response_body
        begin
          @response_body = open(path,"User-Agent" => "Ruby/Yahoo Site Explorer Gem v#{Yahoo::SE::VERSION}").readlines.join
        rescue OpenURI::HTTPError => @errors
          raise ResponseError, @errors
        end
      end
      
      # The results from the response object
      def results
        response.results
      end
    end
  end
end