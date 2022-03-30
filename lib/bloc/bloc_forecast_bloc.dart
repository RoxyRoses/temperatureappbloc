import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:temperatureapp/model/forecast_repository.dart';

import '../model/forecast_model.dart';

part 'bloc_forecast_event.dart';
part 'bloc_forecast_state.dart';

class BlocForecastBloc extends Bloc<BlocForecastEvent, BlocForecastState> {
  final ForecastRepository repository;
  BlocForecastBloc(this.repository) : super(BlocForecastInitial()) {
    // ignore: void_checks
    on<SearchForecastEvent>((event, emit) async {
        try {
          final forecast = await repository.fetchForecast(event.name);
          if (forecast == null) {
            emit(
              ErrorForecastState(message: 'Type the name of the city'),
            );
          } else {
            emit(
              SuccessForecastState(forecast),
            );
          }
        } catch (e) {
          emit(ErrorForecastState(message: 'Something went wrong'));
          print(e);
        }
      }
    );
  }
}

Future<ForecastsModel> fetchForecast(String model) async {
  ForecastsModel forecast;
  try {
    var http;
    final response = await http.get(
      Uri.parse('https://goweather.herokuapp.com/weather/' +
          model.replaceAll(' ', '')),
    );
    await Future.delayed(const Duration(seconds: 2));
    forecast = ForecastsModel.fromJson(jsonDecode(response.body));
    forecast.name = model[0].toUpperCase() + model.substring(1);
    return forecast;
  } on Exception catch (_) {
    throw Exception('Failed to load forecast');
  }
}
