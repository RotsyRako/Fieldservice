import 'package:field_service/src/models/dto/auth/sign_in/user_token.dto.dart';
import 'package:field_service/src/models/dto/base_response.dto.dart';

class SignInResponseDto extends BaseResponseDto {
  late UserTokenDto data;

SignInResponseDto.fromJson(Map<String, dynamic> json)
    : super.fromJson(json) {
  var jsonData = json["data"];
  if (jsonData != null && jsonData is Map) {
    data = UserTokenDto.fromJson(jsonData as Map<String, dynamic>);
  }
}
}


