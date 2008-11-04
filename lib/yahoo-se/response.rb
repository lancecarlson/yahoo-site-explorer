module Yahoo
  module SE
    class Response
      def initialize(response_body)
        @body = response_body
      end
      
      def total_results
        self.to_json["ResultSet"]["totalResultsReturned"].to_i
      end
    
      def total_results_available
        self.to_json["ResultSet"]["totalResultsAvailable"].to_i
      end
      
      def results
        self.to_json["ResultSet"]["Result"].map do |result_hash|
          Yahoo::SE::Result.new(result_hash)
        end
      end
      
      def to_json
        @json = @json ||= JSON.parse(@body)
      end
    end
  end
end