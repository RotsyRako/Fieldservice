import 'package:arkup_edoo/common/exceptions/app.exception.dart';
import 'package:arkup_edoo/common/utils/app.log.dart';
import 'package:arkup_edoo/models/dto/base_response.dto.dart';

class RemoteException extends AppException {
  int _statusCode = 0;
  String _errorMessage = "";
  AppLog loger = AppLog.instance;

  RemoteException({String remoteMessage = "", int code = 0}) : super('', '') {
    statusCode = code;
    if (remoteMessage.isNotEmpty) {
      errorMessage = remoteMessage;
      message = '';
    } else {
      message = remoteMessage;
    }

    prefix = errorMessage;
    loger.print(tag: "REMOTE EXCEPTION", data: toString());
  }

  set errorMessage(String message) {
    this._errorMessage = message;
  }

  String get errorMessage => this._errorMessage;

  set statusCode(int code) {
    this._statusCode = code;
    switch (_statusCode) {
      case 400:
        errorMessage = "Invalid Request: ";
        break;
      case 403:
        errorMessage = "Unauthorised: ";
        break;
      default:
        errorMessage = "Pas de connexion internet";
    }
  }

  BaseResponseDto toBaseResponseDto() => BaseResponseDto(
      success: false, message: message.isEmpty ? errorMessage : message);
}
