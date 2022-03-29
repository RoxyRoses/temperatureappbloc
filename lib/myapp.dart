import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temperatureapp/bloc/bloc_forecast_bloc.dart';
import 'package:temperatureapp/view/firstpage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<BlocForecastBloc>(
            create: (context) => BlocForecastBloc(),
          ),
        ],
        child: BlocBuilder<BlocForecastBloc, BlocForecastState>(
          builder: (context, state) {
          if(state is StartForecastState) return const CircularProgressIndicator();
          if(state is ErrorForecastState) return FirstPage(error: state.message);
          if(state is SuccessForecastState) return const FirstPage();
          return const FirstPage();
        } ),),
      );
    
  }
}