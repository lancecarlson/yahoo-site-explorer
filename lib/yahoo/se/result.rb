module Yahoo
  module SE
    class Result
      def initialize(request)
        @body = request.body
      end
      
      def total_results
        self.to_json["ResultSet"]["totalResultsReturned"].to_i
      end
    
      def total_results_available
        self.to_json["ResultSet"]["totalResultsAvailable"].to_i
      end
      
      def results
        self.to_json["ResultSet"]["Result"]
      end
      
      def to_json
        @json = @json ||= JSON.parse(@body)
      end
    end
  end
end