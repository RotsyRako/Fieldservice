
import 'package:arkup_edoo/models/dto/base_response.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation_items.dto.dart';

class SynchronisationResponseDto extends BaseResponseDto {
  late List<SynchronisationItemsDTO> data;

SynchronisationResponseDto.fromJson(Map<String, dynamic> json)
    : super.fromJson(json) {
  var jsonData = json["data"];
  if (jsonData != null && jsonData is List) {
    data = jsonData
        .map((e) => SynchronisationItemsDTO.fromJson(e))
        .toList();
  } else {
    data = [];
  }
}

}
