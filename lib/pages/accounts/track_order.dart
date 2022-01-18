import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<Map<String, dynamic>> optionsList = [
    {
      "date": "Sept 23, 2018",
      "orders": [
        {
          "order_id": "OD - 424923192 - N",
          "amount": 1500,
          "status": "In Transit",
          "products": [
            {
              "product_id": "1",
              "image":
                  "https://unsplash.com/photos/dwKiHoqqxk8/download?force=true&w=640"
            },
            {
              "product_id": "2",
              "image":
                  "https://unsplash.com/photos/164_6wVEHfI/download?force=true&w=640"
            },
            {
              "product_id": "3",
              "image":
                  "https://unsplash.com/photos/4qSb_FWhHKs/download?force=true&w=640"
            },
            {
              "product_id": "4",
              "image":
                  "https://unsplash.com/photos/a-QH9MAAVNI/download?force=true&w=640"
            },
            {
              "product_id": "5",
              "image":
                  "https://unsplash.com/photos/_fOL6ebfECQ/download?force=true&w=640"
            },
          ]
        },
        {
          "order_id": "OD - 424923192 - 56767",
          "amount": 15000000,
          "status": "In Transit",
          "products": [
            {
              "product_id": "1",
              "image":
                  "https://unsplash.com/photos/dwKiHoqqxk8/download?force=true&w=640"
            },
            {
              "product_id": "2",
              "image":
                  "https://unsplash.com/photos/164_6wVEHfI/download?force=true&w=640"
            },
            {
              "product_id": "3",
              "image":
                  "https://unsplash.com/photos/4qSb_FWhHKs/download?force=true&w=640"
            },
            {
              "product_id": "4",
              "image":
                  "https://unsplash.com/photos/a-QH9MAAVNI/download?force=true&w=640"
            },
            {
              "product_id": "5",
              "image":
                  "https://unsplash.com/photos/_fOL6ebfECQ/download?force=true&w=640"
            },
          ]
        }
      ],
    },
    {
      "date": "Oct 2020",
      "orders": [
        {
          "order_id": "OD - 424923192 - N567",
          "amount": 1500,
          "status": "In Transit",
          "products": [
            {
              "product_id": "1",
              "image":
                  "https://unsplash.com/photos/dwKiHoqqxk8/download?force=true&w=640"
            },
            {
              "product_id": "2",
              "image":
                  "https://unsplash.com/photos/164_6wVEHfI/download?force=true&w=640"
            },
            {
              "product_id": "3",
              "image":
                  "https://unsplash.com/photos/4qSb_FWhHKs/download?force=true&w=640"
            },
            {
              "product_id": "4",
              "image":
                  "https://unsplash.com/photos/a-QH9MAAVNI/download?force=true&w=640"
            },
            {
              "product_id": "5",
              "image":
                  "https://unsplash.com/photos/_fOL6ebfECQ/download?force=true&w=640"
            },
          ]
        },
        {
          "order_id": "OD - 424923192 - N",
          "amount": 1500,
          "status": "In Transit",
          "products": [
            {
              "product_id": "1",
              "image":
                  "https://unsplash.com/photos/dwKiHoqqxk8/download?force=true&w=640"
            },
            {
              "product_id": "2",
              "image":
                  "https://unsplash.com/photos/164_6wVEHfI/download?force=true&w=640"
            },
            {
              "product_id": "3",
              "image":
                  "https://unsplash.com/photos/4qSb_FWhHKs/download?force=true&w=640"
            },
            {
              "product_id": "4",
              "image":
                  "https://unsplash.com/photos/a-QH9MAAVNI/download?force=true&w=640"
            },
          ]
        }
      ],
    }
  ];

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
    return Flexible(
      child: Container(
        height: 1,
        color: color,
      ),
    );
  }

  Widget ordersBox() {
    return Column(
      children: List.generate(optionsList.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: getProportionateScreenHeight(32)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Order date
              Text(
                optionsList[index]["date"],
                style:
                    TextStyle(fontSize: 14, color: Colors.black.withAlpha(153)),
              ),
              //Orders
              Column(
                  children: List.generate(optionsList[index]["orders"].length,
                      (indexForOrders) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: getProportionateScreenHeight(16)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/view_order');
                    },
                    child: Container(
                        height: getProportionateScreenHeight(140),
                        width: getProportionateScreenWidth(343),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff242424).withAlpha(40),
                              offset: const Offset(0.0, 1.0), //(x,y)
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: getProportionateScreenHeight(20),
                                  bottom: getProportionateScreenHeight(20),
                                  left: getProportionateScreenWidth(20.9)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        optionsList[index]["orders"]
                                            [indexForOrders]["order_id"],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      Text(
                                        "\$" +
                                            optionsList[index]["orders"]
                                                    [indexForOrders]["amount"]
                                                .toString(),
                                        style: const TextStyle(
                                            color: primaryColor, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: getProportionateScreenHeight(30),
                                    width: getProportionateScreenWidth(80),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: const Color(0xffFFB900)),
                                    child: Text(
                                      optionsList[index]["orders"]
                                          [indexForOrders]["status"],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
//
//This is products image
//

                            Padding(
                              padding: EdgeInsets.only(
                                  top: getProportionateScreenHeight(16),
                                  bottom: getProportionateScreenHeight(16),
                                  right: getProportionateScreenWidth(22)),
                              child: SizedBox(
                                height: 110,
                                width: 100,
                                child: GridView.count(
                                    shrinkWrap: true,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0,
                                    //Believe me don not mess up with this logic ;)
                                    children: List.generate(
                                        optionsList[index]["orders"]
                                                            [indexForOrders]
                                                        ["products"]
                                                    .length >
                                                4
                                            ? 4
                                            : optionsList[index]["orders"]
                                                    [indexForOrders]["products"]
                                                .length,
                                        (indexForProductImages) {
                                      return indexForProductImages == 3
                                          ? optionsList[index]["orders"]
                                                              [indexForOrders]
                                                          ["products"]
                                                      .length ==
                                                  4
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            optionsList[index]
                                                                            [
                                                                            "orders"]
                                                                        [
                                                                        indexForOrders]
                                                                    ["products"]
                                                                [3]["image"]),
                                                        fit: BoxFit.fill,
                                                      )),
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffE1E1E1),
                                                          width: 2)),
                                                  child: Center(
                                                      child: Text(
                                                    "+" +
                                                        (optionsList[index]["orders"]
                                                                            [
                                                                            indexForOrders]
                                                                        [
                                                                        "products"]
                                                                    .length -
                                                                3)
                                                            .toString(),
                                                  )),
                                                )
                                          : Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  image: DecorationImage(
                                                    image: NetworkImage(optionsList[
                                                                            index]
                                                                        [
                                                                        "orders"]
                                                                    [
                                                                    indexForOrders]
                                                                [
                                                                "products"]
                                                            [
                                                            indexForProductImages]
                                                        ["image"]),
                                                    fit: BoxFit.fill,
                                                  )),
                                            );
                                    })),
                              ),
                            )
                          ],
                        )),
                  ),
                );
              }))
            ],
          ),
        );
      }),
    );
  }

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
                      topBar("Order History"),
                      SizedBox(height: getProportionateScreenHeight(56)),
                      ordersBox()
                    ]),
              ),
            ),
          ),
        );
      });
    });
  }
}
