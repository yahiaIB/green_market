import 'package:Vio_Telehealth/utils/preference_utils.dart';

import '../config/config.dart';
import 'package:dio/dio.dart';
import './dio_flutter_transformer.dart';

class HttpClient {
  static Dio _dio;

  static Dio getInstance() {
    if (_dio == null) {
      _dio = Dio();
      _dio
        ..options.baseUrl = Configuration.config['baseUrl']
        ..interceptors.add(LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
        ))
        ..interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
          var token = PreferenceUtils.getInstance().getData(PreferenceUtils.UserToken);
          if (token != null) {
            options.headers['Authorization'] = token;
          }
          return options;
        }))
        ..transformer = FlutterTransformer();
    }
    return _dio;
  }
}
