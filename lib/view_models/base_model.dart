import 'package:Blwahda/helpers/string_translation.dart';
import 'package:Blwahda/utils/utils_functions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel with ChangeNotifier {
  //TODO if you need handle the base progress changes or errors provide setters getters for your values and notify your listener

  bool _busy = false;
  String _error = '';

  String get error => _error;

  handelErrorMessage(err) {
    String eMsg = translate("Unknown Error");
    print(err.runtimeType);
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
    print(eMsg);
    error = eMsg;
    return eMsg;
  }

  handelError(e, {BuildContext context , scaffoldKey }) {
    String error_message = handelErrorMessage(e);
    if(context != null){
      UtilsFunctions.showSnackBar(context: context,text: error_message);
    }else if (scaffoldKey != null){
      UtilsFunctions.showSnackBarWithScaffoldKey(scaffoldKey: scaffoldKey,text: error_message);
    }
    return error_message;
  }

  set error(String value) {
    _error = value;
  }

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
