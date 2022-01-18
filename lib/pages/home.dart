import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:fine_wine/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'NavBarScreens/accountTab.dart';
import 'NavBarScreens/cartTab.dart';
import 'NavBarScreens/homeTab.dart';

class HomeScreen extends StatefulWidget {
  int selectedIndex;
  final User user;

  HomeScreen(
      {required Key key, required this.user, required this.selectedIndex})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgetOptions = <Widget>[
    const HomeTabScreen(),
    CartTabScreen(),
    AccountTabScreen()
  ];

  int _selectedIndex = 0;

  Widget bottomNavBarItem(Size size, icon, label, int index) {
    return Container(
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
                child: SvgPicture.asset(icon)));
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
          GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: Container(
                  color: Colors.white,
                  width: size.width * 0.3,
                  child: bottomNavBarItem(
                      size, "assets/icons/Icon_Explore.svg", "Explore", 0))),
          GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: Container(
                  color: Colors.white,
                  width: size.width * 0.3,
                  child: bottomNavBarItem(
                      size, "assets/icons/Icon_Cart.svg", "Cart", 1))),
          GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              child: Container(
                  color: Colors.white,
                  width: size.width * 0.3,
                  child: bottomNavBarItem(
                      size, "assets/icons/Icon_User.svg", "Account", 2))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: bottomNavBar(size),
        body: SafeArea(
          child: widgetOptions.elementAt(_selectedIndex),
        ));
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required Key key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/category',
            arguments: {"category": "$text"});
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            height: getProportionateScreenWidth(55),
            width: getProportionateScreenWidth(55),
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(33),
            ),
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontStyle: FontStyle.normal),
          )
        ],
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: size.height * 0.3,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              category,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: categoryColor),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              price,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
