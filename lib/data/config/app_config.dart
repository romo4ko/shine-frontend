class AppConfig {
  static const Map<String, Map<String, dynamic>> config = {
    'API': {
      'BaseUrl': {
        'Release': 'https://ultrasource.ru/api',
        'Debug': 'http://10.0.2.2:8000/api'
      },
      'Key': '',
    },
    'Payments': {
      'url': '',
      'clientApplicationKey': '',
      'shopId': 'xxxxxx',
      'secretKey': ''
    },
  };
}