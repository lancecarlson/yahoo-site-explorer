module Yahoo
  module SE
    class Result
      def initialize(hash)
        @hash = hash
      end
      
      # The title of the linking web page.
      def title
        @hash["Title"]
      end
      
      # The URL for the linking web page.
      def url
        @hash["Url"]
      end
      
      # The URL that should be used to link to the inlinking page. See URL linking for more information.
      def click_url
        @hash["ClickUrl"]
      end
    end
  end
end