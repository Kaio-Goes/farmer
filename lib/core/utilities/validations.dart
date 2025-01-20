validatorPassword(value, {bool? loginValid}) {
  final password = value ?? '';

  if (value!.isEmpty) {
    return 'Por favor, digite uma senha.';
  }

  if (password.length < 6) {
    return 'Senha deve ter no mínimo 6 caracteres';
  }

  if (password.length > 8) {
    return 'Senha deve ter máximo 8 caracteres';
  }

  if (loginValid != null && !loginValid) {
    return 'Dados inválidos, por favor verifique e tente novamente';
  }
  return null;
}

validatorEmail(value) {
  if (value!.isEmpty) {
    return 'Por favor, digite um e-mail.';
  }
  const pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Por favor, digite um e-mail válido.';
  }

  return null;
}
