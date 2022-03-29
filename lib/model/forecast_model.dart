
class ForecastsModel{
  String? temperature;
  String? wind;
  String? description;
  late String name = '';
  List<Forecast>? forecast;

  ForecastsModel(
      {this.temperature,
      this.wind,
      this.description,
      this.forecast,
      this.name = ''});

  String? get getName {
    return name;
  }

  set setName(String names) {
    name = names;
  }

  ForecastsModel.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    wind = json['wind'];
    description = json['description'];
    if (json['forecast'] != null) {
      forecast = <Forecast>[];
      json['forecast'].forEach((v) {
        forecast!.add(Forecast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temperature'] = temperature;
    data['wind'] = wind;
    data['description'] = description;
    if (forecast != null) {
      data['forecast'] = forecast!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Forecast {
  String day = '';
  String temperature = '';
  String wind = '';

  Forecast({required this.day, required this.temperature, required this.wind});

  Forecast.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    temperature = json['temperature'];
    wind = json['wind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['temperature'] = temperature;
    data['wind'] = wind;
    return data;
  }
}