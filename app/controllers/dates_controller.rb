class DatesController < ApplicationController
  def index
    url = URI("https://historical-events-by-api-ninjas.p.rapidapi.com/v1/historicalevents?month=3&day=30")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = "#{Rails.application.credentials.history_api[:api_key]}"
    request["X-RapidAPI-Host"] = "historical-events-by-api-ninjas.p.rapidapi.com"

    response = http.request(request)
    # render json: response.as_json

    render json: response.body
  end
end
