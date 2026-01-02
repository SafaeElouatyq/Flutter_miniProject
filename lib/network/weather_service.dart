import 'package:dio/dio.dart';
import 'package:flutter_mini_project/models/weather.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_service.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/")
abstract class WeatherService {
  factory WeatherService(Dio dio, {String baseUrl}) = _WeatherService;

  @GET("weather")
  Future<Weather> getWeather(
      @Query("q") String city,
      @Query("appid") String apikey,
      @Query("units") String units,
      );
}
