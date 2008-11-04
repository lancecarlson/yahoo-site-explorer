module Yahoo
  module SE
    class Result
      def initialize(hash)
        @hash = hash
      end
      
      def url
        hash["Url"]
      end
    end
  end
end