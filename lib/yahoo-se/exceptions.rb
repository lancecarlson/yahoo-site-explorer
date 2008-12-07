module Yahoo
  module SE
    class ApplicationIDNotSet < RuntimeError; end
    class ResponseError < RuntimeError
      def initialize(errors)
        title = errors["Title"]
        message = errors["Message"]
        puts "#{title} : #{message}"
      end
    end
  end
end