class BaseResponseDto {
  bool success = false;
  String message = "";

  BaseResponseDto({
    this.success = true,
    this.message = ""
  });

  BaseResponseDto.fromJson(Map<String, dynamic> json) {
    try {
      if (json != null) {
        success = json["success"];
        message =  json["message"];
      } else
        BaseResponseDto();
    } catch (e) {
      BaseResponseDto();
    }
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'success': success,
    'message': message
  };

  dynamic getData(json) {
    if (json != null) {
      var jsonData = json["data"];
      if (jsonData is dynamic) {
        return jsonData;
      }
    }
    return null;
  }
}
