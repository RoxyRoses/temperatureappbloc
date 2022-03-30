part of 'bloc_forecast_bloc.dart';

@immutable
abstract class BlocForecastEvent {
  const BlocForecastEvent();
}

class SearchForecastEvent extends BlocForecastEvent{
final String name;

const SearchForecastEvent(this.name);

List<Object> get props => [name];

}