module Cloverrb
  class Client
    BASE_URL = ENV.fetch("CLOVER_BASE_URL") { "https://api.clover.com" }
    AUTH_URL = ENV.fetch("CLOVER_AUTH_URL") { "https://www.clover.com" }

    def self.get(token, path)
      HTTParty.get("#{BASE_URL}/v3" + path, headers: build_headers(token)).parsed_response
    end

    def self.post(token, path, body)
      HTTParty.post(
        "#{BASE_URL}/v3" + path,
        headers: build_headers(token),
        query: body
      ).parsed_response
    end

    def self.put(token, path, body)
      HTTParty.put(
        "#{BASE_URL}/v3" + path,
        headers: build_headers(token),
        query: body
      ).parsed_response
    end

    def self.generate_access_token(client_id, code, app_secret)
      query = build_query(client_id, code, app_secret)
      HTTParty.get("#{AUTH_URL}/oauth/token", query: query)
    end

    private

    def self.build_headers(token)
      { "Authorization" => "Bearer #{token}"}
    end 

    def self.build_query(client_id, code, app_secret)
      {
        "client_id" => client_id,
        "client_secret" => app_secret,
        "code" => code
      }
    end 
  end
end