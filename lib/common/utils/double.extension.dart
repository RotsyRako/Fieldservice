extension Methods on double {
  String formatDouble() => _formatDouble(this);
}

String _formatDouble(double number) {
  String formattedNumber = number.toStringAsFixed(
      1); // Convertir en string en conservant un chiffre après la virgule

  // Séparer la partie entière et la partie décimale
  List<String> parts = formattedNumber.split('.');
  String integerPart = parts[0];
  String decimalPart = parts.length > 1 ? parts[1] : '';

  // Formater la partie entière par groupes de trois
  String result = '';
  int count = 0;
  for (int i = integerPart.length - 1; i >= 0; i--) {
    count++;
    result = integerPart[i] + result;
    if (count == 3 && i != 0) {
      result = ' $result';
      count = 0;
    }
  }

  // Ajouter la partie décimale si elle existe
  if (decimalPart.isNotEmpty) {
    result += '.$decimalPart';
  }

  return result.trim(); // Retirer les espaces en trop
}
