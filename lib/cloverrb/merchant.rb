module Cloverrb
  class Merchant < Client
    def self.find(merchant_id, token)
      url = "/merchants/#{merchant_id}?expand=owner"
      get(token, url)
    end
  end
end