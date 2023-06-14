import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/services/weather_api.dart';

abstract class IRepository {
  Future<Forecast> getWeather(String city);
}

class Repository extends IRepository {
  final IWeatherApi weatherApi;
  Repository(this.weatherApi);

  @override
  Future<Forecast> getWeather(String city) async {
    final location = await weatherApi.getLocation(city);
    return await weatherApi.getWeather(location);
  }
}
