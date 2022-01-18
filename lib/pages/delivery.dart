import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
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

  Widget divider() {
    return Flexible(
      child: Container(
        height: 1,
        color: Color(0xffDDDDDD),
      ),
    );
  }

  Widget progressBar() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(5),
            right: getProportionateScreenWidth(5),
            top: getProportionateScreenHeight(44)),
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
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle),
              ),
              decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(
                    color: primaryColor,
                    width: 1,
                  ),
                  shape: BoxShape.circle),
            ),
            divider(),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffDDDDDD),
                    width: 1,
                  ),
                  shape: BoxShape.circle),
            ),
            divider(),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffDDDDDD),
                    width: 1,
                  ),
                  shape: BoxShape.circle),
            ),
          ],
        ),
      ),
      SizedBox(
        height: getProportionateScreenHeight(14),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Delivery",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "Address",
            style:
                TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.50)),
          ),
          Text(
            "Payments",
            style:
                TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.50)),
          )
        ],
      )
    ]);
  }

  Widget deliveryOptions() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Standard Delivery",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order will be delivered between 3 - 5 business days",
                  maxLines: 2,
                  style: TextStyle(fontSize: 14),
                ),
                Container(
                  width: 24,
                  height: 24,
                  child: Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(color: Color(0xffDDDDDD), width: 6),
                        shape: BoxShape.circle),
                  ),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget bottomNavBar(Size size, context) {
    return Container(
      height: getProportionateScreenHeight(84),
      width: size.width * 0.4,
      padding: EdgeInsets.only(right: getProportionateScreenWidth(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [addButton(context, size)],
      ),
    );
  }

  Widget addButton(context, Size size) {
    return Container(
      width: size.width * 0.4,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF00C569),
          //onPrimary: Color(0xFF00C569),
        ),
        child: Text(
          "NEXT",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/address');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Object? category = ModalRoute.of(context)?.settings.arguments;

    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        //SizerUtil().init(constraints, orientation);
        return Scaffold(
          bottomNavigationBar: bottomNavBar(size, context),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(44),
                  horizontal: getProportionateScreenWidth(16)),
              child: Column(children: [
                topBar("Checkout"),
                SizedBox(height: getProportionateScreenHeight(20)),
                progressBar(),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                deliveryOptions(),
              ]),
            ),
          ),
        );
      });
    });
  }
}
