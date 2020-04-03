module Cloverrb
  class Employee < Client
    def self.all(merchant_id, token, role=nil)
      url = "/merchants/#{merchant_id}/employees"
      url += "?filter=role=#{role}" if role
      get(token, url)
    end

    def self.find(merchant_id, token, employee_id)
      url = "/merchants/#{merchant_id}/employees/#{employee_id}"
      get(token, url)
    end
  end
end