module Cloverrb
  class Address < Client
    def self.fetch(merchant_id, token)
      url = "/merchants/#{merchant_id}/address"
      get(token, url)
    end
  end
end