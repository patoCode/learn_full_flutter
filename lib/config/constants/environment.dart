import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String environment = dotenv.env['ENVIRONMENT'] ?? 'DEV';
  static String apikey = dotenv.env['API_WEATHER_KEY'] ?? '';

  static String uriApi = dotenv.env['API_WEATHER_URI'] ?? '';
  static String geoUriApi = dotenv.env['API_GEOLOCATION'] ?? '';
}
