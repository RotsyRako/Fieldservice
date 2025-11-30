import 'package:field_service/src/models/dto/base_response.dto.dart';

/// Modèle de données pour l'estimation d'une intervention
class InterventionEstimateDataDto {
  final String estimatedTime;
  final String reasoning;
  final double confidence;

  InterventionEstimateDataDto({
    required this.estimatedTime,
    required this.reasoning,
    required this.confidence,
  });

  factory InterventionEstimateDataDto.fromJson(Map<String, dynamic> json) {
    // estimatedTime peut être une string (format "HH:mm:ss") ou un nombre
    String estimatedTimeStr;
    if (json['estimatedTime'] is String) {
      estimatedTimeStr = json['estimatedTime'] as String;
    } else if (json['estimatedTime'] is num) {
      // Si c'est un nombre, convertir en format "HH:mm:ss"
      final hours = (json['estimatedTime'] as num).toDouble();
      final h = hours.floor();
      final minutes = ((hours - h) * 60).floor();
      final seconds = (((hours - h) * 60 - minutes) * 60).floor();
      estimatedTimeStr = '${h.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    } else {
      estimatedTimeStr = '00:00:00';
    }

    return InterventionEstimateDataDto(
      estimatedTime: estimatedTimeStr,
      reasoning: json['reasoning'] as String? ?? '',
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'estimatedTime': estimatedTime,
        'reasoning': reasoning,
        'confidence': confidence,
      };
}

/// Réponse de l'API pour l'estimation d'une intervention
class InterventionEstimateResponseDto extends BaseResponseDto {
  late InterventionEstimateDataDto data;

  InterventionEstimateResponseDto.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    try {
      var jsonData = json['data'];
      if (jsonData != null && jsonData is Map<String, dynamic>) {
        data = InterventionEstimateDataDto.fromJson(jsonData);
      } else {
        data = InterventionEstimateDataDto(
          estimatedTime: '00:00:00',
          reasoning: '',
          confidence: 0.0,
        );
      }
    } catch (e) {
      // En cas d'erreur de parsing, utiliser des valeurs par défaut
      data = InterventionEstimateDataDto(
        estimatedTime: '00:00:00',
        reasoning: '',
        confidence: 0.0,
      );
    }
  }
}

