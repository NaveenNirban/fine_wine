import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:fine_wine/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  static List<item> items = [
    item(
        name: "Tag Heuernar",
        price: 1100,
        image:
            "https://images.unsplash.com/photo-1495609051331-23a311cc40fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1948&q=80"),
    item(
        name: "Tag Heuernar",
        price: 1100,
        image:
            "https://images.unsplash.com/photo-1605733160314-4fc7dac4bb16?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1368&q=80"),
    item(
        name: "Tag Heuernar",
        price: 1100,
        image:
            "https://images.unsplash.com/photo-1518027830478-6a75ff88c3aa?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80"),
    item(
        name: "Tag Heuernar",
        price: 1100,
        image:
            "https://images.unsplash.com/photo-1449505278894-297fdb3edbc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80")
  ];

  List<item> listItems =
      List.generate(items.length, (int index) => items[index]);

  Widget topBar(name) {
    return Row(
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
            name,
            style: const TextStyle(fontSize: 20),
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
    );
  }

  Widget divider(Color color) {
    return Container(
      height: 1,
      color: color,
    );
  }

  Widget sectionTitle(title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget address() {
    return const Flexible(
      child: Text(
        "21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria",
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget deliveryBox() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(24),
          horizontal: getProportionateScreenWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle("Shipping Address"),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              address(),
              SizedBox(
                width: getProportionateScreenWidth(33),
              ),
              Container(
                width: 24,
                height: 24,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                ),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: primaryColor),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              "Change",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
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
          "PAY",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          //Navigator.pushNamed(context, '/upi_test');
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

  Widget itemsList() {
    return SizedBox(
      height: getProportionateScreenHeight(201),
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: getProportionateScreenHeight(120),
                      height: getProportionateScreenHeight(120),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4.0)),
                          color: Colors.yellow,
                          image: DecorationImage(
                            image: NetworkImage(
                              listItems[index].image,
                            ),
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      listItems[index].name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "\$" + listItems[index].price.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: primaryColor),
                    )
                  ]),
            );
          }),
    );
  }

  Widget paymentBox() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(24),
          horizontal: getProportionateScreenWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle("Payment"),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                SizedBox(
                  width: getProportionateScreenWidth(40),
                  height: getProportionateScreenHeight(20),
                  child: SvgPicture.asset(
                    "assets/images/upi.svg",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(20),
                ),
                const Text(
                  "8221061947@paytm",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ]),
              SizedBox(
                width: getProportionateScreenWidth(33),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 24,
                  height: 24,
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  ),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: primaryColor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              "Change",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final Map category = ModalRoute.of(context).settings.arguments;

    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        //SizerUtil().init(constraints, orientation);
        return Scaffold(
          bottomNavigationBar: bottomNavBar(size, context),
          body: SafeArea(
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(16),
                      right: getProportionateScreenWidth(16),
                      top: getProportionateScreenHeight(44)),
                  child: topBar("Summary"),
                ),
                SizedBox(height: getProportionateScreenHeight(56)),
                itemsList(),
                divider(const Color(0xffBDC4CC)),
                deliveryBox(),
                SizedBox(
                  height: getProportionateScreenWidth(25),
                ),
                divider(const Color(0xffBDC4CC)),
                paymentBox()
              ]),
            ),
          ),
        );
      });
    });
  }
}
