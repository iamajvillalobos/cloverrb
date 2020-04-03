module Cloverrb
  class Payment < Client
    def self.all(merchant_id, token, options = {})
      url = "/merchants/#{merchant_id}/payments?expand=refunds&expand=cardTransaction&expand=tender&expand=transactionInfo"
      url += add_date_filters(options)
      url += add_limit_and_offset(options)
      get(token, url)
    end

    def self.find(merchant_id, token, payment_id)
      url = "/merchants/#{merchant_id}/payments/#{payment_id}?expand=refunds&expand=cardTransaction&expand=tender&expand=transactionInfo"
      get(token, url)
    end

    private

    def self.add_date_filters(options)
      filter = ""
      if options["startDateTime"].present?
        filter += "&filter=createdTime>=#{options['startDateTime']}"
      end
      if options["endDateTime"].present?
        filter += "&filter=createdTime<=#{options['endDateTime']}"
      end
      filter
    end

    def self.add_limit_and_offset(options)
      filter = ""
      if options["limit"].present?
        filter += "&limit=#{options['limit']}"
      end
      if options["offset"].present?
        filter += "&offset=#{options['offset']}"
      end
      filter
    end
  end
end