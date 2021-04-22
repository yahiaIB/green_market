import 'package:dio/dio.dart';

class ExceptionHelper implements Exception {
  String tag;
  String message;
  ExceptionHelper([this.message, this.tag]);

  static parse({Exception err, String message}) {
    String eMsg = 'Unknown Error';
    String nMsg = eMsg;

    try {
      if (err is DioError) {
        switch (err.type) {
          case DioErrorType.CANCEL:
            eMsg = "Request Cancelled";
            break;
          case DioErrorType.CONNECT_TIMEOUT:
            eMsg = "Request Timeout";
            break;
          case DioErrorType.DEFAULT:
            eMsg = "No Internet Connection";
            break;
          case DioErrorType.RECEIVE_TIMEOUT:
            eMsg = "Send Timeout";
            break;
          case DioErrorType.RESPONSE:
            switch (err.response.statusCode) {
              case 400:
                eMsg = err.response.data['message'];
                break;
              case 401:
                eMsg = "Unauthorised Request";
                break;
              case 403:
                eMsg = "Unauthorised Request";
                break;
              case 404:
                eMsg = "Not Found";
                break;
              case 409:
                eMsg = "Conflict";
                break;
              case 408:
                eMsg = "Request Timeout";
                break;
              case 500:
                eMsg = "Internal Server Error";
                break;
              case 503:
                eMsg = "Service Unavailable";
                break;
              case 504:
                eMsg = "Gateway Time-out";
                break;
              default:
                var responseCode = err.response.statusCode;
                eMsg = "Received invalid status code: $responseCode";
            }
            break;
          case DioErrorType.SEND_TIMEOUT:
            eMsg = "Send Timeout";
            break;
        }
      } else {
        eMsg = "Internal Server Error";
      }
    } catch (e) {} finally {
      if (message != null) {
        nMsg = '${message}\n${eMsg}';
      } else {
        nMsg = eMsg;
      }
    }
    return ExceptionHelper(nMsg);
  }
}
