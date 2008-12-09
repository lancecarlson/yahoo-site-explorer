module Yahoo
  module SE
    class ApplicationIDNotSet < RuntimeError; end
    class ResponseError < RuntimeError
      def initialize(errors)
        case errors.class
        when Hash
          title = errors["Title"]
          message = errors["Message"]
          puts "#{title} : #{message}"
        when String
          puts errors
        else
          puts errors.to_s
        end
      end
    end
  end
end