import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/forecast_model.dart';

part 'bloc_forecast_event.dart';
part 'bloc_forecast_state.dart';

class BlocForecastBloc extends Bloc<BlocForecastEvent, BlocForecastState> {
  BlocForecastBloc() : super(BlocForecastInitial()) {
    // ignore: void_checks
    on<BlocForecastEvent>((event, emit) async* {
      if (event is searchForecastEvent) {
        try {
          yield StartForecastState();
          final forecast = await fetchForecast(event.name);
          if(forecast == null)
          {yield ErrorForecastState(message: 'Type the name of the city');} else {
            yield SuccessForecastState(forecast);
          }
        } catch (e) {
          yield ErrorForecastState(message: 'Something went wrong');
          print(e);
        }
      }
    });
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
