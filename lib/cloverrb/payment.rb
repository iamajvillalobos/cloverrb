module Cloverrb
  class Payment < Client
    def self.all(merchant_id, token)
      url = "/merchants/#{merchant_id}/payments?expand=refunds"
      get(token, url)
    end

    def self.find(merchant_id, token, payment_id)
      url = "/merchants/#{merchant_id}/payments/#{payment_id}?expand=refunds"
      get(token, url)
    end
  end
end