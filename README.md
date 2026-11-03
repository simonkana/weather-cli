# Weather CLI

A simple command-line Ruby script that fetches and displays current weather for a city using the OpenWeatherMap API.

## Prerequisites

Make sure you have **Ruby** installed on your system.

## Installation

1. Clone the repository and move into its directory:

   ```bash
   git clone https://github.com/simonkana/weather-cli.git
   cd weather-cli
   ```

2. Install the required gems:

   ```bash
   gem install httparty
   ```

3. Get an API key from [OpenWeatherMap](https://openweathermap.org/api) and replace the `your_api_key` placeholder assigned to `API_KEY` in `weather.rb`.

## Usage

Run the script from your terminal by passing the city name as an argument:

```bash
ruby weather.rb Prague
```

### Example Output

```text
Getting weather for Prague...

City: Prague
Temperature: 14.5 °C
Description: scattered clouds
Humidity: 65 %
```

