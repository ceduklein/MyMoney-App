extension StringExtension on String {
  String onlyNumber() => replaceAll(RegExp(r'[^0-9]'), '');

  String trimLeftZeros() => replaceAll(RegExp(r'^0+'), '');
}
