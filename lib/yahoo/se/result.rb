module Yahoo
  module SE
    class Result
      def initialize(hash)
        @hash = hash
      end
      
      def title
        @hash["Title"]
      end
      
      def url
        @hash["Url"]
      end
      
      def click_url
        @hash["ClickUrl"]
      end
    end
  end
end