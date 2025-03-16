import 'package:yumemi_weather/yumemi_weather.dart';

String handleMiddleImage() {
  final yumemiWeather = YumemiWeather();
  final weatherCondition = yumemiWeather.fetchSimpleWeather();
  return weatherCondition;
}
