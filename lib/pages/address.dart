import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
          const Center(
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

  Widget deliveryAddressConfirmation() {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          ),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: primaryColor),
        ),
        SizedBox(
          width: getProportionateScreenWidth(14),
        ),
        const Text(
          "Billing address is the same as delivery address",
          style: TextStyle(fontSize: 14),
        )
      ],
    );
  }

  Widget divider(Color color) {
    return Flexible(
      child: Container(
        height: 1,
        color: color,
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
                    color: const Color(0xffDDDDDD),
                    width: 1,
                  ),
                  shape: BoxShape.circle),
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
            divider(const Color(0xffDDDDDD)),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffDDDDDD),
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
          const Text(
            "Delivery",
            style: TextStyle(fontSize: 13),
          ),
          const Text(
            "Address",
            style: TextStyle(fontSize: 13, color: Colors.black),
          ),
          Text(
            "Payments",
            style:
                TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.50)),
          )
        ],
      )
    ]);
  }

  Widget addressBox() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Standard Delivery",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
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
                        border: Border.all(
                            color: const Color(0xffDDDDDD), width: 6),
                        shape: BoxShape.circle),
                  ),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget bottomNavBar(Size size, context) {
    return SizedBox(
      height: getProportionateScreenHeight(84),
      width: size.width * 0.4,
      //padding: EdgeInsets.only(right: getProportionateScreenWidth(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [backButton(context, size), nextButton(context, size)],
      ),
    );
  }

  Widget nextButton(context, Size size) {
    return SizedBox(
      width: size.width * 0.4,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF00C569),
          //onPrimary: Color(0xFF00C569),
        ),
        child: const Text(
          "NEXT",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/payments');
        },
      ),
    );
  }

  Widget backButton(context, Size size) {
    return SizedBox(
      width: size.width * 0.4,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: const BorderSide(color: primaryColor)),
          //onPrimary: Color(0xFF00C569),
        ),
        child: const Text(
          "BACK",
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget addressForm() {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Street 1'),
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Street 2'),
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'City'),
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        Row(
          children: [
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'State'),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(37),
            ),
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Country'),
              ),
            )
          ],
        )
      ],
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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(44),
                    horizontal: getProportionateScreenWidth(16)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      topBar("Checkout"),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      progressBar(),
                      SizedBox(
                        height: getProportionateScreenHeight(50),
                      ),
                      deliveryAddressConfirmation(),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      addressForm()
                    ]),
              ),
            ),
          ),
        );
      });
    });
  }
}
