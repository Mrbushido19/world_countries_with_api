class ApiException implements Exception {
  final String error;

  ApiException(this.error);
}
