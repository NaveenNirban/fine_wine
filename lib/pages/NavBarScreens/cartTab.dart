import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:fine_wine/widgets/dashedLine.dart';
import 'package:flutter/material.dart';

class CartTabScreen extends StatefulWidget {
  @override
  _CartTabScreenState createState() => _CartTabScreenState();
}

class _CartTabScreenState extends State<CartTabScreen> {
  List<Map<String, dynamic>> products = [
    {
      "image":
          "https://unsplash.com/photos/3OZr-hLbsq0/download?force=true&w=640",
      "name": "BeoPlay Speaker",
      "category": "Bang and Olufsen",
      "price": "₹755"
    },
    {
      "image":
          "https://unsplash.com/photos/3OZr-hLbsq0/download?force=true&w=640",
      "name": "BeoPlay Speaker",
      "category": "Bang and Olufsen",
      "price": "₹755"
    },
    {
      "image":
          "https://unsplash.com/photos/3OZr-hLbsq0/download?force=true&w=640",
      "name": "BeoPlay Speaker",
      "category": "Bang and Olufsen",
      "price": "₹755"
    },
    {
      "image":
          "https://unsplash.com/photos/3OZr-hLbsq0/download?force=true&w=640",
      "name": "BeoPlay Speaker",
      "category": "Bang and Olufsen",
      "price": "₹755"
    },
  ];

  Widget bestSellingList(Size size) {
    return Expanded(
      child: Container(
        height: getProportionateScreenHeight(500),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            products.length,
            (index) => ProductCard(
              image: products[index]["image"],
              name: products[index]["name"],
              category: products[index]["category"],
              price: products[index]["price"],
              press: () {},
              key: Key("unique1"),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNavBar(Size size, context) {
    return Container(
      height: getProportionateScreenHeight(84),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [BoxShadow(color: Colors.white)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TOTAL",
                  style: TextStyle(fontSize: 12, color: Color(0xff929292)),
                ),
                Text(
                  "₹1500",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                )
              ],
            ),
          ),
          addButton(context, size)
        ],
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
          "CHECKOUT",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/delivery');
        },
      ),
    );
  }

  Widget dividerProducts() {
    return Container(
      height: 2,
      color: Color(0xffDDDDDD),
    );
  }

  Widget dividerDotted() {
    return DashedLine(
      height: 0.5,
      dashWidth: 3,
      color: Colors.grey,
    );
  }

  Widget bill() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
          vertical: getProportionateScreenHeight(20)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Sub Total",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: getProportionateScreenWidth(16),
              ),
              dividerDotted(),
              SizedBox(
                width: getProportionateScreenWidth(16),
              ),
              Text(
                "\$3950",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(16),
          ),
          Row(
            children: [
              Text(
                "Tax",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: getProportionateScreenWidth(16),
              ),
              dividerDotted(),
              SizedBox(
                width: getProportionateScreenWidth(16),
              ),
              Text(
                "\$50",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: bottomNavBar(size, context),
        body: Center(
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List.generate(
                  products.length,
                  (index) => Dismissible(
                    key: Key(products[index]["name"]),
                    onDismissed: (direction) {},
                    background: itemdeleteBg(),
                    child: ProductCard(
                      image: products[index]["image"],
                      name: products[index]["name"],
                      category: products[index]["category"],
                      price: products[index]["price"],
                      press: () {},
                      key: Key("unique"),
                    ),
                  ),
                ),
              ),
              dividerProducts(),
              bill(),
              dividerProducts()
            ]),
          ),
        ));
  }

  Widget itemdeleteBg() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 10),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    required Key key,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, name, category, price;
  final GestureTapCallback press;
  Widget quantityRegulator() {
    return Container(
      height: getProportionateScreenHeight(30),
      width: getProportionateScreenWidth(95),
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      decoration: BoxDecoration(
          color: Color(0xffF0F0F0), borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.add,
            size: 14,
          ),
          SizedBox(width: 10),
          Text(
            "1",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.remove,
            size: 14,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(16)),
        child: Container(
          height: getProportionateScreenHeight(120),
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                height: getProportionateScreenHeight(120),
                width: getProportionateScreenWidth(120),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                height: getProportionateScreenHeight(120),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: getProportionateScreenHeight(15),),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "BeoPlay Speaker",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "₹1500",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: primaryColor),
                          ),
                        ]),
                    //SizedBox(height: getProportionateScreenHeight(3),),

                    quantityRegulator()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
