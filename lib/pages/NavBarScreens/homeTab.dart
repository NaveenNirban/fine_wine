import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/models/HomeTab/productCard.dart';
import 'package:fine_wine/models/HomeTab/productSection.dart';
import 'package:fine_wine/models/categories/categoryModel.dart';
import 'package:fine_wine/models/categories/categorySectionModel.dart';
import 'package:fine_wine/services/userProvider.dart';
import 'package:fine_wine/widgets/categoryCard.dart';
import 'package:fine_wine/widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const HomeTabScreen());
}

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  List<ProductSectionModel> listProductSections = [
    ProductSectionModel(sectionTitle: "Best Selling", products: [
      ProductCardModel(
          name: "BeoPlay Speaker",
          category: "Bang and Olufsen",
          price: 755,
          image: "assets/icons/Image.jpeg"),
      ProductCardModel(
          name: "BeoPlay Speaker",
          category: "Bang and Olufsen",
          price: 755,
          image: "assets/icons/Image.jpeg"),
      ProductCardModel(
          name: "BeoPlay Speaker",
          category: "Bang and Olufsen",
          price: 755,
          image: "assets/icons/Image.jpeg"),
      ProductCardModel(
          name: "BeoPlay Speaker",
          category: "Bang and Olufsen",
          price: 755,
          image: "assets/icons/Image.jpeg"),
    ]),
    ProductSectionModel(sectionTitle: "Best Selling", products: [
      ProductCardModel(
          name: "BeoPlay Speaker",
          category: "Bang and Olufsen",
          price: 755,
          image: "assets/icons/Image.jpeg"),
      ProductCardModel(
          name: "BeoPlay Speaker",
          category: "Bang and Olufsen",
          price: 755,
          image: "assets/icons/Image.jpeg"),
    ])
  ];

  List<CategorySectionModel> categoryList = [
    CategorySectionModel(title: "Categories", categories: [
      CategoryModel(name: "Boots", image: "assets/icons/Game Icon.svg"),
      CategoryModel(name: "Boots", image: "assets/icons/Game Icon.svg"),
      CategoryModel(name: "Boots", image: "assets/icons/Game Icon.svg"),
      CategoryModel(name: "Boots", image: "assets/icons/Game Icon.svg"),
      CategoryModel(name: "Boots", image: "assets/icons/Game Icon.svg"),
      CategoryModel(name: "Boots", image: "assets/icons/Game Icon.svg"),
    ])
  ];

  int _selectedIndex = 0;
  Widget searchBar() {
    return Container(
      //alignment: Alignment.center,
      //height: getProportionateScreenHeight(40),
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 3)
          ]),
      child: TextField(
        //cursorHeight: 30,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: getProportionateScreenHeight(28),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget bestSellingList(Size size) {
    return SizedBox(
      height: getProportionateScreenHeight(370),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(listProductSections.length, (index) {
          return ProductCard(productSectionModel: listProductSections[index]);
          // return ProductCard1(image: image, name: name, category: category, price: price, press: press)
        }),
      ),
    );
  }

  Widget bottomNavBarItem(Size size, icon, label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
          alignment: Alignment.center,
          height: size.height * 0.08,
          width: size.width / 3,
          child: index == _selectedIndex
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$label",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "•",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              : Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(icon))),
    );
  }

  Widget bottomNavBar(Size size) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [BoxShadow(color: Colors.white)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          bottomNavBarItem(size, "assets/icons/Icon_Explore.svg", "Explore", 0),
          bottomNavBarItem(size, "assets/icons/Icon_Cart.svg", "Cart", 1),
          bottomNavBarItem(size, "assets/icons/Icon_User.svg", "Account", 2),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Provider.of<UserProvider>(context, listen: false).toString();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(16),
                    top: getProportionateScreenHeight(32)),
                child: searchBar(),
              ),

              Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(16),
                    bottom: getProportionateScreenHeight(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    //,
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: List.generate(categoryList.length, (index) {
                  // return Text(index.toString());

                  return CategoryCard(cardSectionModel: categoryList[index]);
                }),
              ),
              const SizedBox(
                height: 40,
              ),

              //Products
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: List.generate(listProductSections.length, (index) {
                  // return Text(index.toString());

                  return ProductCard(
                    productSectionModel: listProductSections[index],
                  );
                }),
              )

              //bestSellingList(size),
            ],
          ),
        ),
      ),
    );
  }
}
