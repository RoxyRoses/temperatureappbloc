part of 'bloc_forecast_bloc.dart';

@immutable
abstract class BlocForecastState{
  const BlocForecastState();
}

class BlocForecastInitial extends BlocForecastState {
  @override
  List<Object> get props => [];
}

class StartForecastState extends BlocForecastState{
  @override
  List<Object>? get props => null;
}

class SuccessForecastState extends BlocForecastState{
final ForecastsModel forecast;

const SuccessForecastState(this.forecast);

  @override
  List<Object>? get props => [forecast];
}

class ErrorForecastState extends BlocForecastState{
  final String message;

  ErrorForecastState({this.message = ''});

  @override
  List<Object> get props => [message];

}
