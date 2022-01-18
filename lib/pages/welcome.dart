import 'dart:async';
import 'dart:convert';

import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:fine_wine/models/userLogin.dart';
import 'package:fine_wine/services/authProvider.dart';
import 'package:fine_wine/widgets/background_painter.dart';
import 'package:fine_wine/widgets/loggedIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

//import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // Variables & declarations
  late UserLogin userLogin;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  late double safeHeight;
  final storage = const FlutterSecureStorage();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool isFbSignIn = false;
  //FirebaseAuth _auth = FirebaseAuth.instance;
  //FacebookLogin _facebookLogin = FacebookLogin();
  late User _user;

  // Methods
  // Sign in method statically typed
  signIn(String username, String password) async {
    setState(() {
      _isLoading = true;
    });
    String url = "http://192.168.43.232:80/api-token-auth/";
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"username": username, "password": password};

    // Try block for server timeout
    try {
      var jsonResponse;
      var res = await http
          .post(Uri.parse(url), body: body)
          .timeout(const Duration(seconds: 7));
      if (res.statusCode == 200) {
        jsonResponse = json.decode(res.body);
        if (kDebugMode) {
          print("Response status : ${res.statusCode}");
          print("Response body : $jsonResponse");
        }
        if (jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });
          await storage.write(key: "token", value: jsonResponse['token']);
          Navigator.pushNamed(context, '/home_tab');
        }
      } else {
        jsonResponse = json.decode(res.body);
        /* for(int i;i<jsonResponse['non_field_errors'].length();i++){
        print(jsonResponse['non_field_errors'][i]);
      }*/
        print(jsonResponse['non_field_errors']);
        setState(() {
          _isLoading = false;
        });
      }
    }
    // catching server timeout exception
    on TimeoutException catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Server Timeout");
    }
  }

  // Widgets
  Widget forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
          onTap: () {},
          child:
              const Text("Forgot Password?", style: TextStyle(fontSize: 14))),
    );
  }

  Widget signInButton(_formKey) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          //onPrimary: Color(0xFF00C569),
        ),
        child: const Text(
          "SIGN IN",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: _isLoading
            ? null
            : () {
                {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.pushNamed(context, "/home");
                    //signin(username.text, password.text);
                  } else {
                    if (kDebugMode) {
                      print("form is invalid");
                    }
                  }
                }
              },
      ),
    );
  }

  Widget loginBox() {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Welcome,",
                    style: TextStyle(
                        fontSize: boardingScreenTitleSize, fontWeight: bold),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18, color: primaryColor),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                "Sign in to Continue",
                style: TextStyle(
                    fontSize: boardingFadedSubtextSize,
                    color: const Color(0xff929292)),
              ),

              //Input Fields
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email field
                      TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                            labelText: "Username",
                            labelStyle:
                                TextStyle(fontSize: inputValueTextSize)),
                        // The validator receives the text that the user has entered.
                        /* validator: (email) {
                          if (email == null || email.isEmpty ) {
                            return kEmailNullError;
                          }
                          if(!emailValidatorRegExp.hasMatch(email))
                            {
                              return kInvalidEmailError;
                            }
                          return null;
                        },*/
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),

                      //Password field
                      TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle:
                                TextStyle(fontSize: inputValueTextSize)),
                        // The validator receives the text that the user has entered.
                        /* validator: (password) {
                          if (password == null || password.isEmpty) {
                            return kPassNullError;
                          }
                          if (!passwordValidatorRegExp.hasMatch(password)) {
                            return kPassInvalidError;
                          }
                          return null;
                        },*/
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      forgotPassword(),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      signInButton(_formKey)
                    ],
                  ))
            ]),
          )
        ],
      ),
    );
  }

  Widget orText() {
    return const Text(
      "-OR-",
      style: TextStyle(fontSize: 18),
    );
  }

  Widget signInWithGoogle() {
    return SizedBox(
      height: getProportionateScreenHeight(50),
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: getProportionateScreenHeight(20),
                width: getProportionateScreenHeight(20),
                child: SvgPicture.asset("assets/icons/google.svg")),
            const Text(
              "Sign In with Google",
              style: TextStyle(
                  fontWeight: normal, fontSize: 14, color: Colors.black),
            ),
            const Text("")
          ],
        ),
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          if (kDebugMode) {
            print("signing in.....");
          }
          provider.login();
        },
      ),
    );
  }

  Widget signInWithFacebook() {
    return SizedBox(
      height: getProportionateScreenHeight(50),
      child: OutlinedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: getProportionateScreenHeight(20),
                width: getProportionateScreenHeight(20),
                child: SvgPicture.asset("assets/icons/facebook.svg")),
            const Text(
              "Sign In with Facebook",
              style: TextStyle(
                  fontWeight: normal, fontSize: 14, color: Colors.black),
            ),
            const Text("")
          ],
        ),
        /*onPressed: () async {
          await handleLogin();
        },*/
      ),
    );
  }

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          const Center(child: CircularProgressIndicator()),
        ],
      );

  Widget welcomeScreen() {
    return SafeArea(
      child: Container(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          /*safeHeight = constraints.maxHeight;
          width = constraints.maxWidth;*/
          return SingleChildScrollView(
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(90),
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
                      loginBox(),
                      SizedBox(
                        height: getProportionateScreenHeight(28),
                      ),
                      orText(),
                      SizedBox(
                        height: getProportionateScreenHeight(43),
                      ),
                      signInWithFacebook(),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      signInWithGoogle()
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

  //Build method
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final provider = Provider.of<GoogleSignInProvider>(context);
          if (provider.isSigningIn) {
            return buildLoading();
          } else if (snapshot.hasData) {
            return LoggedInWidget();
          } else {
            return welcomeScreen();
          }
        },
      ),
    ));
  }

/*  Future<void> handleLogin() async {
    final FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
      case FacebookLoginStatus.loggedIn:
        try {
          await loginWithfacebook(result);
        } catch (e) {
          print(e);
        }
        break;
    }
  }*/

/*  Future loginWithfacebook(FacebookLoginResult result) async {
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    var a = await _auth.signInWithCredential(credential);
    setState(() {
      isFbSignIn = true;
      _user = a.user;
    });
  }*/

/*  Future<void> gooleSignout() async {
    await _auth.signOut().then((onValue) {
      setState(() {
        _facebookLogin.logOut();
        isFbSignIn = false;
      });
    });
  }*/
}
