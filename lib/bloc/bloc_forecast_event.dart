part of 'bloc_forecast_bloc.dart';

@immutable
abstract class BlocForecastEvent {
  const BlocForecastEvent();
}

class searchForecastEvent extends BlocForecastEvent{
final String name;

const searchForecastEvent(this.name);

List<Object> get props => [name];

}