String? validateEmailField(String? value) {
  if (value == null || value.isEmpty) return 'Digite seu email';
  RegExp regExp = RegExp(
    r"[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+",
  );
  if (!regExp.hasMatch(value)) return 'Este não é um email válido';

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return 'Digite a sua senha';
  if (value.length < 8) return 'A senha deve conter 8 caractéres';

  return null;
}
