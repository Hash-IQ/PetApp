import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

Color background = Colors.white;
Color purple = Color.fromRGBO(0, 32, 63, 1);
//headline
TextStyle head1 = new TextStyle(
  color: purple,
  fontSize: 30,
);
//sub head intro
TextStyle sub1 = new TextStyle(
  color: Colors.grey[400],
  fontSize: 18,
  fontWeight: FontWeight.normal,
);
TextStyle name = GoogleFonts.yanoneKaffeesatz(
    fontSize: 25,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: Colors.black);
    TextStyle titl = GoogleFonts.yanoneKaffeesatz(
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: Colors.black);
TextStyle sub = GoogleFonts.yanoneKaffeesatz(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    color: Colors.black);
    TextStyle terms = GoogleFonts.yanoneKaffeesatz(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    color: Colors.blue);
TextStyle buttonloc = GoogleFonts.yanoneKaffeesatz(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    color: Colors.white);
    TextStyle termshead = GoogleFonts.yanoneKaffeesatz(
    fontSize: 25,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    color: Colors.black);
// TextStyle name = GoogleFonts.yanoneKaffeesatz(
//     fontSize: 20,
//     fontStyle: FontStyle.normal,
//     fontWeight: FontWeight.bold,
//     color: Colors.black);

TextStyle button = new TextStyle(
  color: Colors.white,
  fontSize: 20,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
);
TextStyle textfield1 = new TextStyle(
  color: Colors.black,
  fontSize: 15,
  fontWeight: FontWeight.normal,
);
TextStyle text1 = new TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.normal,
);
TextStyle text2 = new TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.normal,
);
TextStyle grey5 = new TextStyle(
  color: Colors.grey,
  fontSize: 15,
  fontWeight: FontWeight.normal,
);
TextStyle button1 = new TextStyle(
  color: Colors.white,
  fontSize: 20,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
);
TextStyle button2 = new TextStyle(
  color: Colors.black,
  fontSize: 20,
  // fontWeight: FontWeight.bold,
);
TextStyle categoryTittle = new TextStyle(
  color: Colors.black,
  fontSize: 16,
  // fontWeight: FontWeight.bold,
);
TextStyle appHead = new TextStyle(
  color: Colors.white,
  fontSize: 20,
  letterSpacing: 1,
  fontWeight: FontWeight.normal,
);
OutlineInputBorder form = new OutlineInputBorder(
  borderRadius: new BorderRadius.circular(10.0),
  borderSide: BorderSide(width: 2, color: purple),
);
void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Constants.themeGradients[0],
    textColor: Colors.white,
  );
}

void showToastLong(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Constants.themeGradients[0],
    textColor: Colors.white,
  );
}

class Constants {
  static final rupeeSymbol = "\u20B9";
  static const String FEATURE_NOT_AVAILABLE = "Feature not available";

  ///gradients
  static List<Color> kitGradients = [
    Colors.white,
    Colors.black,
    Colors.grey,
    Color(0xFFf0f0f0),
  ];

  static List<Color> themeGradients = [Color(0xff7606b5)];

  ///error
  static const String SOME_ERROR_OCCURRED = "Some error occurred.";

  ///max video file file in bytes
  static const int MAX_SIZE_IN_BYTES = 30000000; //30 MB max size

  ///login
  static const String LOGIN_LABEL_TEXT = "Outlook ID";
  static const String LOGIN_PASSWORD_LABEL_TEXT = "Password";
  static const String LOGIN_HELPER_TEXT = "Please enter your Outlook ID";
  static const String LOGIN_PASSWORD_HELPER_TEXT = "Minimum 6 characters.";
  static const String LOGIN_CONFIRMATION_TEXT = "Do you really want to logout?";
  static const String LOGOUT_TEXT = "Logout";
  static const String LOGOUT_TITLE = "Enter Login Details";

  ///no internet
  static const String NO_INTERNET_TEXT = "No Internet Connection !!!";
  static const String INTERNET_CONNECTED = "Internet Connected !!!";

  ///file size
  static const String FILE_SIZE_NOT_VALID =
      "Please select file with size less than 20MB";

  ///validators

  static OutlineInputBorder authTextFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(4.0),
  );
  static const TextStyle location = TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
  );
  static const TextStyle title = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Roboto',
  );
  static const TextStyle title2 = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontFamily: 'Roboto',
  );
  static const TextStyle titleButton = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontFamily: 'Roboto',
  );
  static const TextStyle waring =
      TextStyle(color: Colors.red, fontFamily: 'Roboto', fontSize: 20);
}
