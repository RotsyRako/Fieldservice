// ignore_for_file: unused-code
import 'package:diacritic/diacritic.dart';

extension StringExtension on String {
  String get capitalize {
    if (isEmpty) {
      return this;
    }

    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String buildQueryParams(Map<String, dynamic> queryParams) {
    final queryParamsNotNullable = <String, dynamic>{};
    queryParams.forEach((key, value) {
      if (value != null) {
        queryParamsNotNullable[key] = value.toString();
      }
    });

    return Uri(
      path: this,
      queryParameters: queryParamsNotNullable.isEmpty
          ? null
          : queryParamsNotNullable,
    ).toString();
  }

  String normalize() => removeDiacritics(this).toLowerCase().trim();
}
