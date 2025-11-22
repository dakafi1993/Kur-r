class Validators {
  // Email validator
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Zadejte email';
    }
    if (!value.contains('@')) {
      return 'Neplatný email';
    }
    return null;
  }

  // Password validator
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Zadejte heslo';
    }
    if (value.length < 6) {
      return 'Heslo musí mít alespoň 6 znaků';
    }
    return null;
  }

  // Confirm password validator
  static String? Function(String?) confirmPassword(String originalPassword) {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Potvrďte heslo';
      }
      if (value != originalPassword) {
        return 'Hesla se neshodují';
      }
      return null;
    };
  }

  // Required field validator
  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return fieldName != null ? 'Zadejte $fieldName' : 'Toto pole je povinné';
    }
    return null;
  }

  // Phone validator
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Zadejte telefon';
    }
    return null;
  }

  // Name validator
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Zadejte celé jméno';
    }
    return null;
  }
}
