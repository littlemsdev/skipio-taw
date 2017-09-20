require 'faraday'
require 'json'

class Connection
  # URL for API
  BASE = 'https://stage.skipio.com/api/v2/'

  def self.api
    Faraday.new(url: BASE) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
    end
  end

end
