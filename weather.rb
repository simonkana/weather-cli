# frozen_string_literal: true

require 'httparty'

API_KEY = 'your_api_key'
BASE_URL = 'https://api.openweathermap.org/data/2.5/weather'

def fetch_weather(city)
  puts "Getting weather for #{city}..."

  response = HTTParty.get(
    BASE_URL,
    query: { q: city, appId: API_KEY, units: 'metric' }
  )

  if response.code == 401
    warn 'You must set valid API key'
    exit 1
  end

  weather_data = response.parsed_response

  {
    city: weather_data['name'],
    temperature: weather_data.dig('main', 'temp'),
    description: weather_data.dig('weather', 0, 'description'),
    humidity: weather_data.dig('main', 'humidity')
  }
end

def show_weather(weather_data)
  puts ''
  puts "City: #{weather_data[:city]}"
  puts "Temperature: #{weather_data[:temperature]} °C"
  puts "Description: #{weather_data[:description]}"
  puts "Humidity: #{weather_data[:humidity]} %"
end

def main
  if ARGV.empty?
    warn 'Usage: ruby weather.rb <name_of_the_city>'
    exit 1
  end

  city = ARGV.first
  weather_data = fetch_weather(city)
  show_weather(weather_data)
end

main if __FILE__ == $PROGRAM_NAME
