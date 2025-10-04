import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef VoidClosure = Function();
typedef Closure<T> = T Function(T);
typedef WidgetForDto<T> = Widget Function(T);
typedef CompletionClosure<T> = Function(T);
typedef ValidatorClosure<T> = String Function(T);

typedef T DataCreator<T>();

extension NullableUtils<T> on T? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;
}

extension FunctionalExtension<T> on T {
  R map<R>(R Function(T value) fn) {
    return fn(this);
  }
}

extension NullableStringUtils on String? {
  bool get isNullOrEmpty => isNull || this!.isEmpty;

  bool get isNotNullOrEmpty => isNotNull && this!.isNotEmpty;

  String get orEmpty => isNotNull ? this! : '';

  String capitalize() {
    if (isNullOrEmpty) {
      return '';
    }

    return this![0].toUpperCase() + this!.substring(1);
  }

  String capitalizeWords() {
    if (isNullOrEmpty) {
      return '';
    }

    return this!
        .replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.capitalize())
        .join(' ');
  }
}

extension JsonUtils on Map<String, dynamic> {
  String? getString(String fieldName) => this[fieldName] as String?;

  DateTime? getDate(String fieldName) =>
      getString(fieldName)?.map(DateTime.parse);

  int? getInt(String fieldName) {
    return catching(() => this[fieldName] as int).fold(
          (dynamic _) => getString(fieldName)?.map(int.tryParse),
          (value) => value,
    );
  }

  /// Returns double value equivalent to given field.
  /// This method is smart and get extract a double from any of the fields:
  ///
  /// - a standard double type: {"adouble": 189.65}
  /// - an int type: {"adouble": 189} (will return double 189.0)
  /// - a double encoded as a string: {"adouble": "189.65"}
  /// - an int encoded as a string: {"adouble": "189"} (will return double 189.0)
  double? getDouble(String fieldName) {
    return catching(() => this[fieldName] as double?).fold(
          (dynamic _) => catching(() => getInt(fieldName)!.toDouble()).fold(
            (dynamic _) => getString(fieldName)?.map(double.tryParse),
            (value) => value,
      ),
          (value) => value,
    );
  }

  bool? getBool(String fieldName) {
    return catching(() => this[fieldName] as bool).fold(
          (dynamic _) =>
      getString(fieldName) == null ? null : getString(fieldName) == 'true',
          (value) => value,
    );
  }

  Iterable<T> getIterable<T>(String fieldName) =>
      (this[fieldName] as List<dynamic>? ?? <dynamic>[])
          .map((dynamic value) => value as T);

  Iterable<Map<String, dynamic>> getJsonArray(String fieldName) =>
      getIterable<Map<String, dynamic>>(fieldName);

  List<T> getList<T>(String fieldName) => getIterable<T>(fieldName).toList();

}

 String formatDuration(Duration duration) {
    return [
      duration.inHours.toString().padLeft(2, '0'),
      (duration.inMinutes % 60).toString().padLeft(2, '0'),
      (duration.inSeconds % 60).toString().padLeft(2, '0'),
    ].join(':');
  }

  double convertTimeToDoubleHours(String time) {
    final parts = time.split(':');
    if (parts.length != 3) return 0.0;

    final hours = int.tryParse(parts[0]) ?? 0;
    final minutes = int.tryParse(parts[1]) ?? 0;
    final seconds = int.tryParse(parts[2]) ?? 0;

    return hours + (minutes / 60) + (seconds / 3600);
  }

  String normalizeToDdMMyyyy(String date) {
    final patterns = ['dd/MM/yyyy', 'd/M/yyyy', 'dd/M/yyyy', 'd/MM/yyyy'];
    for (final p in patterns) {
      try {
        final parsed = DateFormat(p).parseStrict(date);
        return DateFormat('dd/MM/yyyy').format(parsed);
      } catch (_) {
        // Try next pattern
      }
    }
    return date; // Fallback to original if parsing fails
  }

  String extensionFromPath(String path) {
    try {
      final base = path.split('/').last;
      final dot = base.lastIndexOf('.');
      return dot != -1 ? base.substring(dot) : '';
    } catch (_) {
      return '';
    }
  }

  Future<String?> fileToBase64(String? filePath) async {
  if (filePath == null || filePath.isEmpty) {
    debugPrint("❌ Chemin du fichier invalide (null ou vide)");
    return null;
  }

  try {
    final file = File(filePath);

    if (!await file.exists()) {
      debugPrint("❌ Fichier non trouvé : $filePath");
      return null;
    }

    final bytes = await file.readAsBytes();
    return base64Encode(bytes);
  } catch (e, stack) {
    debugPrint("❌ Erreur lors de la conversion en base64 : $e");
    debugPrint("Stack trace : $stack");
    return null;
  }
}