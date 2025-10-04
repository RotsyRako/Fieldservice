enum Priority {
  high('1', 'Haute'),
  medium('0', 'Basse');

  final String value;
  final String displayName;

  const Priority(this.value, this.displayName);

  static Priority fromValue(String value) {
    return values.firstWhere(
          (e) => e.value == value,
      orElse: () => throw ArgumentError('Unknown priority value: $value'),
    );
  }
}

extension PriorityStringExt on String {
  Priority toPriority() => Priority.fromValue(this);
}