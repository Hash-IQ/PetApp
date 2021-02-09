String validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value) || value == null)
    return 'Enter a valid email address';
  else
    return null;
}

String validateMobile(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String validatePassword(String value) {
  Pattern pattern = r'^(?=.*?[0-9]).{6,}$';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty) {
    return "Password is empty";
  } else if (value.length < 6) {
    return "Password must be 6 characters and one number";
  } else if (!regex.hasMatch(value)) {
    return "Password must be 6 characters and one number";
  }
  return null;
}

String validateName(String value) {
  if (value.isEmpty) {
    return "Name is empty";
  } else if (value.length < 2) {
    return "Name must be 2 characters and one number";
  }
  return null;
}

String validateUserName(String value) {
  if (value.isEmpty) {
    return "UserName is empty";
  } else if (value.length < 4) {
    return "UserName must be 4 characters and one number";
  }
  return null;
}
