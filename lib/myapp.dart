import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temperatureapp/bloc/bloc_forecast_bloc.dart';
import 'package:temperatureapp/model/forecast_repository.dart';
import 'package:temperatureapp/view/firstpage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BlocProvider(
        create: (context) => BlocForecastBloc(ForecastRepository()),
        child: const FirstPage(),
       ),
      ).modular();
  }
}