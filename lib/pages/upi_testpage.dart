/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leathershop/constants.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';


import '../size_config.dart';

class UpiTestScreen extends StatefulWidget {
  @override
  _UpiTestScreenState createState() => _UpiTestScreenState();
}

class _UpiTestScreenState extends State<UpiTestScreen> {
  Razorpay _razorpay;
  int totalAmount = 0;

  @override
  void initState(){
    super.initState();
    _razorpay =  Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose(){
    super.dispose();
    _razorpay.clear();
  }

 void openCheckout() async {
   var options = {
     'key': 'rzp_test_XQxIQwmViOrIIc',
     'amount': totalAmount*100,
     'name': 'Sam Shop',
     'description': 'Fine T-Shirt',
     'prefill': {
       'contact': '8888888888',
       'email': 'test@razorpay.com'
     },
     'external': {
       'wallets' : ['paytm']
     }
   };
   try{
     _razorpay.open(options);
   }
   catch(e){
     debugPrint(e);
   }
 }
  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "SUCCESS: "+response.paymentId);
  }
  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "FAILED: "+response.code.toString() + " - " + response.message);
  }
  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "EXTERNAL WALLET: " + response.walletName);
  }


  Widget topBar(name) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 24,
            height: 24,
            child: SvgPicture.asset("assets/icons/Back ICon.svg"),
          ),
          Center(
            child: Text(
              "Checkout",
              style: TextStyle(fontSize: 20),
            ),
          ),
          //To centralise the title
          Container(
            alignment: Alignment.centerLeft,
            width: 24,
            height: 24,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget divider(Color color){
    return Flexible(
      child: Container(
        height: 1,
        color: color,
      ),
    );
  }

  Widget progressBar(){
    return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(5),right: getProportionateScreenWidth(5),top:getProportionateScreenHeight(44)),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(color: Colors.white,width: 5),
                        shape: BoxShape.circle
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(
                        color: Color(0xffDDDDDD),
                        width: 1,
                      ),
                      shape: BoxShape.circle
                  ),
                ),
                divider(primaryColor),
                Container(
                  width: 30,
                  height: 30,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(color: Colors.white,width: 5),
                        shape: BoxShape.circle
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(
                        color: Color(0xffDDDDDD),
                        width: 1,
                      ),
                      shape: BoxShape.circle
                  ),
                ),
                divider(primaryColor),
                Container(
                  width: 30,
                  height: 30,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(color: Colors.white,width: 5),
                        shape: BoxShape.circle
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(
                        color: primaryColor,
                        width: 1,
                      ),
                      shape: BoxShape.circle
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(14),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery",style: TextStyle(fontSize: 13),),
              Text("Address",style: TextStyle(fontSize: 13,color: Colors.black),),
              Text("Payments",style: TextStyle(fontSize: 13,color: Colors.black),)
            ],
          )
        ]);
  }

  Widget bottomNavBar(Size size,context){
    return Container(
      height: getProportionateScreenHeight(84),
      width: size.width*0.4,
      //padding: EdgeInsets.only(right: getProportionateScreenWidth(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          backButton(context,size),
          nextButton(context,size)
        ],
      ),
    );
  }

  Widget nextButton(context,Size size){
    return Container(
      width: size.width*0.4,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF00C569),
          //onPrimary: Color(0xFF00C569),
        ),
        child: Text("NEXT",style: TextStyle(fontSize: 14,color: Colors.white),),
        onPressed:() {
          openCheckout();
        },
      ),
    );
  }

  Widget backButton(context,Size size){
    return Container(
      width: size.width*0.4,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: BorderSide(color: primaryColor)
          ),
          //onPrimary: Color(0xFF00C569),
        ),
        child: Text("BACK",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),),
        onPressed:() {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget payementForm(){
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Amount',
          ),
          onChanged: (value){
            setState(() {
              totalAmount = num.parse(value);
            });
          },
        ),
        SizedBox(height: getProportionateScreenHeight(40),),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map category = ModalRoute.of(context).settings.arguments;

    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil().init(constraints, orientation);
        return Scaffold(
          bottomNavigationBar: bottomNavBar(size, context),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(44),horizontal: getProportionateScreenWidth(16)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children : [
                      topBar("Checkout"),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      progressBar(),
                      SizedBox(height: getProportionateScreenHeight(50),),
                      payementForm()
                    ]),
              ),
            ),
          ),
        );
      });
    });
  }
}
*/
