import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConfig {
  static final String apiUrl = dotenv.get('API_URL');
}
