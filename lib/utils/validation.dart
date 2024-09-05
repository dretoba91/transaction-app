// Email Registration validation
bool emailRegExMatch(String emailText) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailText);
}

// Email val
String? emailVal(String? val) {
  if (val?.isEmpty ?? true) {
    return 'Please enter your email';
  } else if (emailRegExMatch(val ?? "")) {
    return null;
  } else {
    return 'Enter a valid email';
  }
}

// Password val
String? passwordVal(String? val) {
  if (val?.isEmpty ?? true) {
    return 'Please enter your password';
  } else if ((val?.length ?? 0) < 6) {
    return 'Password is not up to 6 characters';
  } else {
    return null;
  }
}
