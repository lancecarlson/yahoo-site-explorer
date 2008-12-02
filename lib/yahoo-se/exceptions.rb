module Yahoo
  module SE
    class ApplicationIDNotSet < RuntimeError; end
    class RateLimitExceeded < RuntimeError; end
  end
end