module Yahoo
  module SE
    def self.pages(domain, options={})
    end
    
    module Pages
      SERVICE_PATH = "#{Yahoo::SE::SERVICE_PATH}/pageData"
    end
  end
end