# app/services/weather_service.rb
require 'httparty'

class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5/forecast'

  API_KEY = ENV['OPENWEATHER_API_KEY'] # Store your API key in an environment variable

  def self.get_forecast(zip_with_country)
    response = get('', {
      query: {
        zip: zip_with_country,
        appid: API_KEY
      }
    })

    response.success? ? response.parsed_response : nil
  end
end
