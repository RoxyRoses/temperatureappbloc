import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temperatureapp/app/app_module.dart';
import 'package:temperatureapp/view/firstpage.dart';
import 'package:temperatureapp/view/forecast_page.dart';
import 'bloc/bloc_forecast_bloc.dart';
import 'model/forecast_model.dart';
import 'model/forecast_repository.dart';
import 'myapp.dart';

final ForecastsModel forecast = ForecastsModel();

void main() {
  runApp( ModularApp(module:AppModule(), child: const MyApp()));
}

