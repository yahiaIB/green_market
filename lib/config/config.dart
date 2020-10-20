enum Environment { LOCAL, DEV, PROD }

class Configuration {
  static Map<String, dynamic> _config = _Config.debugConstants;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
      case Environment.LOCAL:
        _config = _Config.localConstants;
        break;
    }
  }

  static get config {
    return _config;
  }
}

class _Config {
  static Map<String, dynamic> localConstants = {
    "app": {"name": "blwa7da", "version": "1.0.0"},
    "env": "local",
    "baseUrl": "http://192.168.1.5:8080",
    "socketUrl": "https://socketDevBaseUrl",
    "iceServers": {
      'iceServers': [
        {'url': 'stun:api.dev.vio.health:5349'},
        {
          'url': 'turn:api.dev.vio.health:5349',
          'username': 'admin',
          'credential': '1234567r'
        },
      ]
    }
  };
  static Map<String, dynamic> debugConstants = {
    "app": {"name": "BoilearPlate", "version": "1.0.0"},
    "env": "development",
    "baseUrl": "https://devBaseUrl",
    "socketUrl": "https://socketDevBaseUrl",
    "iceServers": {
      'iceServers': [
        {'url': 'stun:api.dev.vio.health:5349'},
        {
          'url': 'turn:api.dev.vio.health:5349',
          'username': 'admin',
          'credential': '1234567r'
        },
      ]
    }
  };

  static Map<String, dynamic> prodConstants = {
    "app": {"name": "BoilearPlate", "version": "1.0.0"},
    "env": "production",
    "baseUrl": "https://baseUrl",
    "socketUrl": "https://SocketsBaseUrl",
    "iceServers": {
      'iceServers': [
        {'url': 'stun:api.clinic.vio.health:5349'},
        {
          'url': 'turn:api.clinic.vio.health:5349',
          'username': 'vio',
          'credential': 'kIPSYW9dtkOUVVXeBjRDA3mneaN6T1j4xZKkJJl2RXNDIyHaFmB6dNhhNSdvIkn3'
        },
      ]
    }
  };
}
