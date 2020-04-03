module Cloverrb
  class Discount < Client
    def self.all(merchant_id, token, order_id)
      url = "/merchants/#{merchant_id}/orders/#{order_id}/discounts"
      get(token, url)
    end
  end
end