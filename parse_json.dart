class Weather {
  String location;
  List<Forecast> forecast;

  Weather({
    required this.location,
    required this.forecast,
  });

}

class Forecast {
  DateTime date;
  int temperatureHigh;
  int temperatureLow;
  String condition;
  int precipitationProbability;

  Forecast({
    required this.date,
    required this.temperatureHigh,
    required this.temperatureLow,
    required this.condition,
    required this.precipitationProbability,
  });

}
