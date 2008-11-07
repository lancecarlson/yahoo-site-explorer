module Yahoo
  API_DOMAIN = "http://search.yahooapis.com"
  
  module SE
    VERSION = "V1"
    SERVICE_PATH = "#{API_DOMAIN}/SiteExplorerService/#{VERSION}"
    
    class << self
      attr_accessor :application_id
      
      def all(obj)
        obj.options[:start] = 1
        obj.options[:results] = 100
        
        # First page of results
        results = obj.results

        # The rest of the page results
        (obj.total_results_available/100).ceil.times do |i|
          results += obj.next
        end
        results
      end
    end
  end
end


%w(exceptions paginator inlinks pages request response result version ping update_notification).each do |file|
  require File.join(File.dirname(__FILE__), "yahoo-se", file)
end