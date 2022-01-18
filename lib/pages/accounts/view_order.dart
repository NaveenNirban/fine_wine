import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:fine_wine/models/viewOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ViewOrderScreen extends StatefulWidget {
  @override
  _ViewOrderScreenState createState() => _ViewOrderScreenState();
}

class _ViewOrderScreenState extends State<ViewOrderScreen> {
  List<ViewOrder> listStatesOfOrder = [
    ViewOrder(
        date: "20/18",
        time: "10:00AM",
        location: "Lagos State, Nigeria",
        stateName: "Order Signed",
        isOnPresentState: false,
        isProcessed: true,
        isComplete: true),
    ViewOrder(
        date: "20/18",
        time: "10:00AM",
        location: "Lagos State, Nigeria",
        stateName: "Order Processed",
        isOnPresentState: false,
        isProcessed: true,
        isComplete: true),
    ViewOrder(
        date: "20/18",
        time: "10:00AM",
        location: "Lagos State, Nigeria",
        stateName: "Shipped",
        isOnPresentState: true,
        isProcessed: false,
        isComplete: true),
    ViewOrder(
        date: "20/18",
        time: "10:00AM",
        location: "Lagos State, Nigeria",
        stateName: "Out for delivery",
        isOnPresentState: false,
        isProcessed: false,
        isComplete: false),
    ViewOrder(
        date: "20/18",
        time: "10:00AM",
        location: "Lagos State, Nigeria",
        stateName: "Delivered",
        isOnPresentState: false,
        isProcessed: false,
        isComplete: false),
  ];

  Widget topBar(name) {
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
    return Flexible(
      child: Container(
        height: 1,
        color: color,
      ),
    );
  }

  Widget progressBar() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          ],
        ),
      ),
    ]);
  }

  /*Widget trackOrder(){
    return Container(
      child: Column(
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
                    Text("20/18",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff929292)
                    ),),
                    Text("10:00 AM",
                      style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff929292)
                      ),),
                  ]),
              SizedBox(width: 30,),
              Column(
                children: [
                  Container(
                    width: getProportionateScreenWidth(30),
                    height: getProportionateScreenHeight(30),
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
                  Container(
                    width: 1,
                    height: getProportionateScreenHeight(90),
                    color: primaryColor,
                  ),
                ],
              ),
              SizedBox(width: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Signed",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),),
                  Text("Lagos State, Nigeria",style: TextStyle(
                      fontSize: 12,
                  ),)
                ]
              )
            ],
          ),

        ],
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    //final Object? category = ModalRoute.of(context)?.settings.arguments;

    SizeConfig().init(context);
    //Size size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        //SizerUtil().init(constraints, orientation);
        return Scaffold(
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
                      topBar("OD - 424923192 - N"),
                      SizedBox(height: getProportionateScreenHeight(56)),
                      ListView(
                          shrinkWrap: true,
                          children:
                              List.generate(listStatesOfOrder.length, (index) {
                            return OrderState(
                                viewOrder: listStatesOfOrder[index]);
                          }))
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
  OrderState({Key? key, required this.viewOrder}) : super(key: key);
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
