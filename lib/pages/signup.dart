import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKeySignup = GlobalKey<FormState>();

  // Variables
  late String email;
  late String name;
  late String password;
  late double safeHeight;

  Widget signUpButton(_formKey) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          //onPrimary: Color(0xFF00C569),
        ),
        child: const Text(
          "SIGN UP",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            if (kDebugMode) {
              print(_formKey);
            }
            Navigator.pushNamed(context, '/verification');
          }

          // if all are valid then go to success screen
        },
      ),
    );
  }

  Widget topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            width: 24,
            height: 24,
            child: SvgPicture.asset("assets/icons/Back ICon.svg"),
          ),
        ),
        Container(),
        //To centralise the title
        Container(),
      ],
    );
  }

  Widget signUpBox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff242424).withAlpha(13),
            blurRadius: 15,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16),
                vertical: getProportionateScreenHeight(14)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Welcome & Signup button
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontWeight: bold),
              ),

              //Input Fields
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Form(
                  key: _formKeySignup,
                  child: Column(
                    children: [
                      // Email field
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle:
                                TextStyle(fontSize: inputValueTextSize)),
                        // The validator receives the text that the user has entered.
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return kNameNullError;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle:
                                TextStyle(fontSize: inputValueTextSize)),
                        // The validator receives the text that the user has entered.
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return kEmailNullError;
                          }
                          if (!emailValidatorRegExp.hasMatch(email)) {
                            return kInvalidEmailError;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),

                      //Password field
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle:
                                TextStyle(fontSize: inputValueTextSize)),
                        // The validator receives the text that the user has entered.
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return kPassNullError;
                          }
                          if (!passwordValidatorRegExp.hasMatch(password)) {
                            return kPassInvalidError;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(60),
                      ),
                      signUpButton(_formKeySignup)
                    ],
                  ))
            ]),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(44),
                ),
                //Dummy element
                Container(),
                // Body of screen to start
                // aligning to elements from bottom
                Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(16),
                      right: getProportionateScreenWidth(16),
                      bottom: getProportionateScreenHeight(48)),
                  child: Column(
                    children: [
                      topBar(),
                      SizedBox(
                        height: getProportionateScreenHeight(62),
                      ),
                      signUpBox()
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
