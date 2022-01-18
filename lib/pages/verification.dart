import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:fine_wine/widgets/topBar.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  static const getProportionateWidth = 50.0;
  static const getProportionateHeight = 60.0;
  /*otp validation & focus*/

  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;
  late FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }
  /* Ends here*/

  Widget continueButton(context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          //onPrimary: Color(0xFF00C569),
        ),
        child: const Text(
          "CONTINUE",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
      ),
    );
  }

  Widget otpForm() {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(getProportionateHeight),
            width: getProportionateScreenWidth(getProportionateWidth),
            child: TextFormField(
              focusNode: pin1FocusNode,
              obscureText: true,
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) => nextField(value, pin2FocusNode),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(getProportionateHeight),
            width: getProportionateScreenWidth(getProportionateWidth),
            child: TextFormField(
              focusNode: pin2FocusNode,
              obscureText: true,
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) => nextField(value, pin3FocusNode),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(getProportionateHeight),
            width: getProportionateScreenWidth(getProportionateWidth),
            child: TextFormField(
              focusNode: pin3FocusNode,
              obscureText: true,
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) => nextField(value, pin4FocusNode),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(getProportionateHeight),
            width: getProportionateScreenWidth(getProportionateWidth),
            child: TextFormField(
              focusNode: pin4FocusNode,
              obscureText: true,
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) => nextField(value, pin5FocusNode),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(getProportionateHeight),
            width: getProportionateScreenWidth(getProportionateWidth),
            child: TextFormField(
              focusNode: pin5FocusNode,
              obscureText: true,
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) => nextField(value, pin6FocusNode),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(getProportionateHeight),
            width: getProportionateScreenWidth(getProportionateWidth),
            child: TextFormField(
              focusNode: pin6FocusNode,
              obscureText: true,
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) {
                if (value.length == 1) {
                  pin6FocusNode.unfocus();
                  // Then you need to check is the code is correct or not
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget verificationBox() {
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
              Text(
                "Verification",
                style: TextStyle(
                    fontSize: boardingScreenTitleSize, fontWeight: bold),
              ),

              SizedBox(
                height: getProportionateScreenHeight(10),
              ),

              Text(
                "A 6 - Digit PIN has been sent to your email address, enter it below to continue",
                style: TextStyle(
                  fontSize: boardingFadedSubtextSize,
                  color: const Color(0xff929292),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(57),
              ),
              otpForm(),
              SizedBox(
                height: getProportionateScreenHeight(65),
              ),
              continueButton(context)
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
                      TopBar(""),
                      SizedBox(
                        height: getProportionateScreenHeight(62),
                      ),
                      verificationBox()
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
