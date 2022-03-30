import 'package:dio/dio.dart';
import 'package:temperatureapp/model/forecast_model.dart';

class ForecastRepository {
  Future<ForecastsModel> fetchForecast(String city) async {
    ForecastsModel forecast;
    try {
      final response = await Dio().get('https://goweather.herokuapp.com/weather/' +
            city.replaceAll(' ', ''),
      );
      await Future.delayed(const Duration(seconds: 2));
      forecast = ForecastsModel.fromJson(response.data);
      forecast.name = city[0].toUpperCase() + city.substring(1);
      return forecast;
    } on Exception catch (_) {
      throw Exception('Failed to load forecast');
    }
  }
}