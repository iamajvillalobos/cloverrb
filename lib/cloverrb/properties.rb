module Cloverrb
  class Properties < Client
    def self.fetch(merchant_id, token)
      url = "/merchants/#{merchant_id}/properties"
      get(token, url)
    end
  end
end