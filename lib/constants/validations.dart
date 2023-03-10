class Validations {
  static String? validateEmpty(String? value) {
    if (value!.isEmpty) return 'This field is required.';
    return null;
  }
}
