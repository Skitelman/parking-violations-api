class NycApiError < StandardError
end

class NycOpenViolationsApi
  API_DOMAIN = 'data.cityofnewyork.us'.freeze
  API_RESOURCE = 'nc67-uf89'.freeze

  def initialize
    @client = SODA::Client.new({ domain: API_DOMAIN })
  end

  def violations_by_plate(plate)
    response = @client.get(API_RESOURCE, { '$where' => "plate = '#{plate}'" })
    if response.code.to_i != 200
      raise NycApiError, "API returned status code #{response.code}"
    end
    response.body
  end
end