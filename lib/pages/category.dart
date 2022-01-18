import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Map<String, dynamic>> products = [
    {
      "id": "1",
      "image": "assets/icons/Image.jpeg",
      "name": "BeoPlay Speaker",
      "category": "Bang and Olufsen",
      "price": "₹755"
    },
    {
      "id": "2",
      "image": "assets/icons/Image.jpeg",
      "name": "BeoPlay Speaker",
      "category": "Bang and Olufsen",
      "price": "₹755"
    },
    {
      "id": "3",
      "image": "assets/icons/Image.jpeg",
      "name": "BeoPlay Speaker",
      "category": "Bang and Olufsen",
      "price": "₹755"
    },
    {
      "id": "4",
      "image": "assets/icons/Image.jpeg",
      "name": "BeoPlay Speaker",
      "category": "Bang and Olufsen",
      "price": "₹755"
    },
  ];
  final String categoryName = "Category";

  final int _selectedIndex = 0;

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
        Text(
          "$name",
          style: const TextStyle(fontSize: 20),
        ),
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26), color: primaryColor),
          child: const Icon(
            Icons.search,
            size: 24,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget productsHead(Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Products",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),

        //bestSellingList(size)
      ],
    );
  }

  Widget productsList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Container(
          //padding: EdgeInsets.only(left: 20, right: 20),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 9 / 16,
            mainAxisSpacing: getProportionateScreenHeight(15),
            crossAxisSpacing: 10,
            // controller: new ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            //scrollDirection: Axis.vertical,
            children: List.generate(products.length, (index) {
              return Card1(
                id: products[index]["id"],
                image: products[index]["image"],
                name: products[index]["name"],
                category: products[index]["category"],
                price: products[index]["price"],
                press: () {},
                key: const Key("key1"),
              );
            }),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Map;
    final categoryName = category['category'].toString();
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        //SizerUtil().init(constraints, orientation);
        return Scaffold(
          body: SafeArea(
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        topBar(categoryName),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        productsHead(size),
                      ],
                    ),
                  ),
                  productsList()
                ]),
          ),
        );
      });
    });
  }
}

class Card1 extends StatelessWidget {
  const Card1({
    required Key key,
    required this.id,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String id, image, name, category, price;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product',
            arguments: {"productId": "$id"});
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(0.5)),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: getProportionateScreenHeight(0.5)),
        Text(
          category,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: categoryColor),
        ),
        SizedBox(height: getProportionateScreenHeight(0.5)),
        Text(
          price,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: primaryColor),
        )
      ]),
    );
  }
}
