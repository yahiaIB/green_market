import 'package:Blwahda/config/constants.dart';
import 'package:Blwahda/utils/preference_utils.dart';

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
          var lang = PreferenceUtils.getInstance().getData(Constants.langCodeKey);
          if (token != null) {
            options.headers['Authorization'] = "Bearer " +token;
//            options.headers['Authorization'] = token;
          }
          options.headers['Accept-Language'] = lang;
          return options;
        }))
        ..transformer = FlutterTransformer();
    }
    return _dio;
  }
}
