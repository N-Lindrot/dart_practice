/* SUMMARY
JSON Data: The jsonData constant holds a string representation of weather forecast data in JSON format.
WeatherData Object Creation: An instance of the WeatherData class named londonWeather is created, passing the location ("London, UK") and the jsonData to its constructor.
WeatherData Constructor: The constructor initializes the location and jsonData properties and calls the private _parseData() method to process the JSON.
_parseData Method: This method does the following:
Decodes the jsonData from a string into a Dart data structure (a Map).
Extracts the "forecast" list from the decoded JSON.
Iterates through the forecast list and creates a ForecastDay object for each day's data.
Adds each ForecastDay object to the forecast list within the WeatherData object.
addForecast Method: This method simply adds a ForecastDay object to the forecast list.
ForecastDay Class: This class defines the structure of a single day's forecast data (date, temperatures, condition, precipitation).
toString Override: The toString method in the ForecastDay class is overridden to provide a custom string representation when a ForecastDay object is printed.
Output: Finally, the print statement outputs the forecast list from the londonWeather object, which now contains a list of formatted ForecastDay strings.
*/

import 'dart:convert';

void main(List<String> args) {  // Add jsonData to a const.
  const jsonData = '''  // jsonData String starts with { 'and' 'data' 'data'{'data'} 'data' 'etc' 'and ends with' }
  {
    "location": "London, UK",
    "forecast": [
    {
      "date": "2024-05-20",
      "temperatureHigh": 18,
      "temperatureLow": 12,
      "condition": "Partly Cloudy",
      "precipitationProbability": 20
    },
    {
      "date": "2024-05-21",
      "temperatureHigh": 20,
      "temperatureLow": 14,
      "condition": "Sunny",
      "precipitationProbability": 5
    },
    {
      "date": "2024-05-22",
      "temperatureHigh": 22,
      "temperatureLow": 15,
      "condition": "Sunny",
      "precipitationProbability": 2
    },
    {
      "date": "2024-05-23",
      "temperatureHigh": 19,
      "temperatureLow": 13,
      "condition": "Cloudy",
      "precipitationProbability": 35
    },
    {
      "date": "2024-05-24",
      "temperatureHigh": 17,
      "temperatureLow": 11,
      "condition": "Rainy",
      "precipitationProbability": 80
    }
      ]
    }
  ''';
  // WeatherData Object is created. WeatherData constructor is used here
  WeatherData londonWeather = WeatherData('London, UK', jsonData);

  // LondonWeatherObject and forecast class is used to print
  print(londonWeather.forecast);
}

class WeatherData {
  String location;
  List<ForecastDay> forecast = [];
  String jsonData;
  //Constructor WeatherData is created, it has 2 data, location and jsonData.
  WeatherData(this.location, this.jsonData) {
    _parseData(); // Constructor use hidden function to parse data
  }

  //hidden function is used seperately and turn jsonData into a defined data
  void _parseData() {
    final data = jsonDecode(jsonData);
    final forecastList = data['forecast'] as List;
    // the data are inserted into a list using (for in-loops)
    for (var forecasrItems in forecastList) {
      final date = forecasrItems['date'];
      final temperatureHigh = forecasrItems['temperatureHigh'];
      final temperatureLow = forecasrItems['temperatureLow'];
      final condition = forecasrItems['condition'];
      final precipitationProbability  = forecasrItems['precipitationProbability'];

      // forecastDay method is created to add data into forecast list
      final forecastDay = ForecastDay(
        date, 
        temperatureHigh, 
        temperatureLow, 
        condition, 
        precipitationProbability
        );
        addForecast(forecastDay);
    }
  }
  void addForecast(ForecastDay day) { // forecast are added one day at a time
    forecast.add(day); 
  }
}

// ForecastDay is defined to set up forecast for each day seperately
class ForecastDay {
  String date;
  int temperatureHigh;
  int temperatureLow;
  String condition;
  int precipitationProbability;

  // Constructor of ForecastDay
  ForecastDay(
    this.date,
    this.temperatureHigh,
    this.temperatureLow,
    this.condition,
    this.precipitationProbability
  );
  // so far this will return instances of this method (Instance of 'ForecastDay').

  @override // Override the default toString() method
  String toString() {
    return 'Date: $date, High: $temperatureHigh°C, Low: $temperatureLow°C, Condition: $condition, Precipitation: $precipitationProbability%';
  }
}
