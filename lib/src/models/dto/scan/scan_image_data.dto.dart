import 'package:field_service/src/models/dto/scan/scan_image_label.dto.dart';

class ScanImageDataDto {
  String? text;
  List<ScanImageLabelDto> labels = [];
  String? detectedObject;
  String? detectedObjectFr;

  ScanImageDataDto({
    this.text,
    required this.labels,
    this.detectedObject,
    this.detectedObjectFr,
  });

  ScanImageDataDto.fromJson(Map<String, dynamic> json) {
    text = json['text'] as String?;
    detectedObject = json['detectedObject'] as String?;
    detectedObjectFr = json['detectedObjectFr'] as String?;
    
    if (json['labels'] != null && json['labels'] is List) {
      labels = (json['labels'] as List)
          .map((e) => ScanImageLabelDto.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }

  Map<String, dynamic> toJson() => {
        'text': text,
        'labels': labels.map((e) => e.toJson()).toList(),
        'detectedObject': detectedObject,
        'detectedObjectFr': detectedObjectFr,
      };
}

