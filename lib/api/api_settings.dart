class ApiSettings {
  static const String _baseUrl = 'http://events.mr-dev.tech/';
  static const String _apiBaseUrl = _baseUrl + 'api/';

  static const String categories = _apiBaseUrl + 'categories/{id}';
  static const String event = _apiBaseUrl + 'events/{id}';
  static const String login = _apiBaseUrl + 'auth/login';
  static const String logout = _apiBaseUrl + 'auth/logout';
}
