import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:fine_wine/models/accounts_tab/shipping.dart';
import 'package:fine_wine/models/viewOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  _ShippingScreenState createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  List<AccountsShippingModel> listAddresses = [
    AccountsShippingModel(
        addressTypeTitle: "Home Address",
        addressDescription:
            "21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria",
        isDefault: true),
    AccountsShippingModel(
        addressTypeTitle: "Work Address",
        addressDescription:
            "19, Martins Crescent, Bank of Nigeria, Abuja, Nigeria",
        isDefault: false)
  ];

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
    return SizedBox(
      width: size.width * 0.4,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF00C569),
          //onPrimary: Color(0xFF00C569),
        ),
        child: const Text(
          "NEW",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          //Navigator.pushNamed(context, '/new_address');
        },
      ),
    );
  }

  Widget topBar(name) {
    return Container(
      child: Row(
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
      ),
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

  Widget deliveryBox() {
    return Column(
        children: List.generate(listAddresses.length, (index) {
      return Padding(
        padding: EdgeInsets.only(bottom: getProportionateScreenHeight(50)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Type title for address
          Text(
            listAddresses[index].addressTypeTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                listAddresses[index].addressDescription,
                style: const TextStyle(fontSize: 16),
              )),
              SizedBox(
                width: getProportionateScreenWidth(33),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    listAddresses[index].isDefault = true;
                    List.generate(listAddresses.length, (index1) {
                      listAddresses[index].addressTypeTitle ==
                              listAddresses[index1].addressTypeTitle
                          ? true
                          : listAddresses[index1].isDefault = false;
                    });
                  });
                },
                child: Container(
                  width: 24,
                  height: 24,
                  child: listAddresses[index].isDefault
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        )
                      : Container(),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: listAddresses[index].isDefault
                          ? primaryColor
                          : const Color(0xff000000).withAlpha(16)),
                ),
              ),
            ],
          )
        ]),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    //final Object? category = ModalRoute.of(context)?.settings.arguments;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topBar("Shipping Address"),
                      SizedBox(height: getProportionateScreenHeight(56)),
                      deliveryBox()
                    ]),
              ),
            ),
          ),
        );
      });
    });
  }
}

class OrderState extends StatelessWidget {
  ViewOrder viewOrder;
  OrderState({required this.viewOrder});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewOrder.date,
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xff929292)),
                  ),
                  Text(
                    viewOrder.time,
                    style:
                        const TextStyle(fontSize: 10, color: Color(0xff929292)),
                  ),
                ]),
            const SizedBox(
              width: 30,
            ),
            Column(
              children: [
                Container(
                  width: getProportionateScreenWidth(30),
                  height: getProportionateScreenHeight(30),
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        //color: viewOrder.isProcessed ? primaryColor : Colors.transparent,
                        border: Border.all(color: Colors.white, width: 5),
                        shape: BoxShape.circle),
                  ),
                  decoration: BoxDecoration(
                      color: viewOrder.isComplete ? primaryColor : Colors.white,
                      border: Border.all(
                        color: viewOrder.isOnPresentState
                            ? primaryColor
                            : const Color(0xffDDDDDD),
                        width: 1,
                      ),
                      shape: BoxShape.circle),
                ),
                viewOrder.stateName == "Delivered"
                    ? Container()
                    : Container(
                        width: 1,
                        height: getProportionateScreenHeight(90),
                        color: viewOrder.isProcessed
                            ? primaryColor
                            : const Color(0xffDDDDDD),
                      )
              ],
            ),
            const SizedBox(
              width: 40,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                viewOrder.stateName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                viewOrder.location,
                style: const TextStyle(
                  fontSize: 12,
                ),
              )
            ])
          ],
        ),
      ],
    );
  }
}
