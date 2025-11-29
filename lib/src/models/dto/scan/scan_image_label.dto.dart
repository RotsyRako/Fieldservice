class ScanImageLabelDto {
  String description;
  double score;
  String descriptionFr;

  ScanImageLabelDto({
    required this.description,
    required this.score,
    required this.descriptionFr,
  });

  ScanImageLabelDto.fromJson(Map<String, dynamic> json)
      : description = json['description'] as String,
        score = (json['score'] as num).toDouble(),
        descriptionFr = json['descriptionFr'] as String;

  Map<String, dynamic> toJson() => {
        'description': description,
        'score': score,
        'descriptionFr': descriptionFr,
      };
}

