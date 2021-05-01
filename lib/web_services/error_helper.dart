import 'package:Blwahda/helpers/string_translation.dart';
import 'package:dio/dio.dart';

class ExceptionHelper implements Exception {
  String tag;
  String message;
  ExceptionHelper([this.message, this.tag]);

  static parse({Exception err, String message}) {
    String eMsg = translate("Unknown Error");
    String nMsg = eMsg;

    try {
      if (err is DioError) {
        switch (err.type) {
          case DioErrorType.CANCEL:
            eMsg = translate("Request Cancelled");
            break;
          case DioErrorType.CONNECT_TIMEOUT:
            eMsg = translate("Request Timeout");
            break;
          case DioErrorType.DEFAULT:
            eMsg = translate("No Internet Connection");
            break;
          case DioErrorType.RECEIVE_TIMEOUT:
            eMsg = translate("Send Timeout");
            break;
          case DioErrorType.RESPONSE:
            switch (err.response.statusCode) {
              case 400:
                eMsg = err.response.data['message'];
                break;
              case 401:
                eMsg = translate("Unauthorised Request");
                break;
              case 403:
                eMsg = translate("Unauthorised Request");
                break;
              case 404:
                eMsg = translate("Not Found");
                break;
              case 409:
                eMsg = translate("Conflict");
                break;
              case 408:
                eMsg = translate("Request Timeout");
                break;
              case 500:
                eMsg = translate("Internal Server Error");
                break;
              case 503:
                eMsg = translate("Service Unavailable");
                break;
              case 504:
                eMsg = translate("Gateway Time-out");
                break;
              default:
                var responseCode = err.response.statusCode;
                eMsg = "${translate("Received invalid status code")}: $responseCode";
            }
            break;
          case DioErrorType.SEND_TIMEOUT:
            eMsg = translate("Send Timeout");
            break;
        }
      } else {
        eMsg = translate("Internal Server Error");
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
