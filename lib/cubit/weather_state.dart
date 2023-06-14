part of 'weather_cubit.dart';

@immutable //meaning their properties cannot be changed once they are created
abstract class WeatherState {}

class WeatherInitial extends WeatherState {
  final String message;
  WeatherInitial(this.message);
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Forecast forecast;

  WeatherLoaded({required this.forecast}) : super();
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}
