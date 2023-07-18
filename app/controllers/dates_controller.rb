class DatesController < ApplicationController
  def index
    # starter_url = `https://historical-events-by-api-ninjas.p.rapidapi.com/v1/historicalevents?month=#{params[:month]}&day=#{params[:day]}`
    starter_url = "https://historical-events-by-api-ninjas.p.rapidapi.com/v1/historicalevents?month=3&day=30"
    # pp starter_url.to_s
    url = URI(starter_url.to_s)
    pp url

    response = Net::HTTP.start(url.host, url.port, :use_ssl => true) do |http|
      request = Net::HTTP::Get.new(url)
      request["X-RapidAPI-Key"] = "#{Rails.application.credentials.history_api[:api_key]}"
      request["X-RapidAPI-Host"] = "historical-events-by-api-ninjas.p.rapidapi.com"

      http.request(request)
    end

    render json: response.body
  end

  def show
    # params.require(:date).permit(:date, :format, :month, :day)
    # @month = params.dig(:date, :month)
    # @day = params.dig(:date, :day)
    @month = params[:month]
    @day = params[:day]
    # pp @month
    # pp @day
    starter_url = "https://historical-events-by-api-ninjas.p.rapidapi.com/v1/historicalevents?month=" + @month + "&day=" + @day
    # pp starter_url
    url = URI(starter_url)

    response = Net::HTTP.start(url.host, url.port, :use_ssl => true) do |http|
      request = Net::HTTP::Get.new(url)
      request["X-RapidAPI-Key"] = "#{Rails.application.credentials.history_api[:api_key]}"
      request["X-RapidAPI-Host"] = "historical-events-by-api-ninjas.p.rapidapi.com"

      http.request(request)
    end

    render json: response.body
  end
end
