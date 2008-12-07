module Yahoo
  module SE
    class Response
      def initialize(response_body)
        @body = response_body
      end
      
      # The number of URLs returned. This may be lower than the number of results requested if there were fewer total results available.
      def total_results_returned
        self.to_json["ResultSet"]["totalResultsReturned"].to_i
      end
    
      # The number of URLs in the database that link to the domain or page.
      def total_results_available
        self.to_json["ResultSet"]["totalResultsAvailable"].to_i
      end
      
      # The result objects returned from the request
      def results
        unless errors
          if total_results_available == 1
            [Yahoo::SE::Result.new(self.to_json["ResultSet"]["Result"])]
          else
            self.to_json["ResultSet"]["Result"].map do |result_hash|
              Yahoo::SE::Result.new(result_hash)
            end
          end
        end
      end
      
      def errors
        @errors = self.to_json["Error"]
        if @errors
          raise ResponseError, @errors
        end
      end
      
      def to_json
        @json ||= JSON.parse(@body)
      end
    end
  end
end