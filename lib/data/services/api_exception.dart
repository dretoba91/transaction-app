class ApiException implements Exception {
  final String message;
  final String? code;

  ApiException(this.message, {this.code});

  @override
  String toString() {
    return 'CustomApiException: $message${code != null ? ' (Code: $code)' : ''}';
  }
}
