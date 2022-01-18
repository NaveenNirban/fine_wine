import 'package:fine_wine/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const kTextColor = Color(0xFF757575);
const primaryColor = Color(0xFF00C569);
const kSecondaryColor = Color(0xFF979797);
const categoryColor = Color(0xFF929292);

// Form Error
final RegExp emailValidatorRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
final RegExp passwordValidatorRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kPassInvalidError =
    "Password should be min. of 8 character & contain \n1 Lowercase\n1 Uppercase\n1 Numeric\n1 Special Character\nCommon allow characters( ! @ # \$ & * ~ )";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

// Font data
const FontWeight normal = FontWeight.w500;
const FontWeight bold = FontWeight.bold;

//Font Size data
double boardingScreenTitleSize = 24.0.sp;
double boardingFadedSubtextSize = 10.0.sp;
double inputValueTextSize = 14.0.sp;
double homeTitleSize = 15.0.sp;

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15.0)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(4)),
    borderSide: const BorderSide(color: kTextColor),
  );
}

class AppUrl {
  static const String liveBaseURL = "https://remote-ur/api/v1";
  static const String localBaseURL = "http://172.0.10.2:3001/";

  static const String baseURL = localBaseURL;
  static const String login = baseURL + "api-token-auth/";
  static const String register = baseURL + "registration/";
  static const String forgotPassword = baseURL + "forgot-password/";
}
