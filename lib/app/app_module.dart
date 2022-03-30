import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:temperatureapp/model/forecast_model.dart';
import 'package:temperatureapp/view/forecast_page.dart';

import '../bloc/bloc_forecast_bloc.dart';
import '../model/forecast_repository.dart';
import '../view/firstpage.dart';

class AppModule extends Module {
  ForecastsModel forecast = ForecastsModel();
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/forecast',
          child: (_, __) => BlocListener<BlocForecastBloc, BlocForecastState>(
            listener: (context, state) {
              if(state is SuccessForecastState){
                forecast = state.forecast;
              }
            },
            child: ForecastPage(
              forecast: forecast,
            ),
          ),
        ),
        ChildRoute(Modular.initialRoute,
            child: (_, __) => BlocProvider(
                  create: (context) => BlocForecastBloc(ForecastRepository()),
                  child: const FirstPage(),
                )),
      ];
}
