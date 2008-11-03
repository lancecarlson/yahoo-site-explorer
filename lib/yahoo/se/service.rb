module Yahoo
  module Service
    def self.hash_to_query(hash)
      hash.map {|key, value| "#{key}=#{value}"}.join("&")
    end
  end
end