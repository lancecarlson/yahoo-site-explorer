module Yahoo
  module SE
    module Paginator
      # The response object from the request
      def response
        raise "Must send a request before you can get a response. Run the results method first!" if @request.nil?
        @response = @request.response
      end
      
      # Reset the start option to the next results
      def next
        @options[:start] = @options[:start] + @options[:results]
        @options[:results] = total_results_available - @options[:start] if last?
        results
      end
      
      def total_results_available
        @total_results_available ||= response.total_results_available
      end
      
      def last?
        (@options[:start] + @options[:results]) >= response.total_results_available
      end
      
      def method_missing(method, *args)
        results
        response.send(method, *args)
      end
    end
  end
end