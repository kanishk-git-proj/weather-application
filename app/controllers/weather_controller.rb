class WeatherController < ApplicationController
  def forecast
    zip = params[:zip]
    country = params[:country]
    zip_with_country = "#{zip},#{country}"

    if zip.blank?
      render json: { error: 'Zip code is required' }, status: :bad_request
      return
    end

    # Fetch weather data from the WeatherService
    forecast = WeatherService.get_forecast(zip_with_country)
    if forecast
      render json: { forecast: forecast } # Return the forecast data
    else
      render json: { error: 'Could not fetch weather data' }, status: :bad_request
    end
  end
end
