module Cloverrb
  class Order < Client
    def self.all(merchant_id, token, options = {})
      url = "/merchants/#{merchant_id}/orders?"

      filters = %w(expand=lineItems expand=lineItems.discounts expand=discounts)
      filters << "filter=createdTime>=#{options[:start_date]}" if has_start_date?(options)
      filters << "filter=createdTime<=#{options[:end_date]}" if has_end_date?(options)
      filters << "filter=state=#{options[:state]}" if has_state?(options)
      url += filters.join("&")

      get(token, url)
    end

    def self.find(merchant_id, token, order_id)
      url = "/merchants/#{merchant_id}/orders/#{order_id}?expand=lineItems&expand=lineItems.discounts&expand=discounts"

      get(token, url)
    end

    def self.total(line_items)
      items = line_items["elements"]
      items.inject(0) { |sum, item| sum + item["price"] }
    end

    def self.has_start_date?(options)
      options[:start_date]
    end

    def self.has_end_date?(options)
      options[:end_date]
    end

    def self.has_state?(options)
      options[:state]
    end
  end
end