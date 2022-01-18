import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:fine_wine/models/wishlist/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  List<WishlistModel> listWishlist = [
    WishlistModel(
        name: "Smart Backpack",
        category: "Bags",
        image:
            "https://images.unsplash.com/photo-1495609051331-23a311cc40fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1948&q=80",
        price: 1500,
        isInStock: false,
        press: () {}),
    WishlistModel(
        name: "Smart Backpack",
        category: "Bags",
        image:
            "https://images.unsplash.com/photo-1495609051331-23a311cc40fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1948&q=80",
        price: 1500,
        isInStock: true,
        press: () {}),
    WishlistModel(
        name: "Smart Backpack",
        category: "Bags",
        image:
            "https://images.unsplash.com/photo-1495609051331-23a311cc40fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1948&q=80",
        price: 1500,
        isInStock: true,
        press: () {}),
    WishlistModel(
        name: "Smart Backpack",
        category: "Bags",
        image:
            "https://images.unsplash.com/photo-1495609051331-23a311cc40fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1948&q=80",
        price: 1500,
        isInStock: false,
        press: () {}),
    WishlistModel(
        name: "Smart Backpack",
        category: "Bags",
        image:
            "https://images.unsplash.com/photo-1495609051331-23a311cc40fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1948&q=80",
        price: 1500,
        isInStock: true,
        press: () {}),
    WishlistModel(
        name: "Smart Backpack",
        category: "Bags",
        image:
            "https://images.unsplash.com/photo-1495609051331-23a311cc40fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1948&q=80",
        price: 1500,
        isInStock: true,
        press: () {}),
    WishlistModel(
        name: "Smart Backpack",
        category: "Bags",
        image:
            "https://images.unsplash.com/photo-1495609051331-23a311cc40fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1948&q=80",
        price: 1500,
        isInStock: false,
        press: () {}),
    WishlistModel(
        name: "Smart Backpack",
        category: "Bags",
        image:
            "https://images.unsplash.com/photo-1495609051331-23a311cc40fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1948&q=80",
        price: 1500,
        isInStock: true,
        press: () {}),
    WishlistModel(
        name: "Smart Backpack",
        category: "Bags",
        image:
            "https://images.unsplash.com/photo-1495609051331-23a311cc40fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1948&q=80",
        price: 1500,
        isInStock: true,
        press: () {})
  ];

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
                      topBar("Wishlist"),
                      SizedBox(height: getProportionateScreenHeight(56)),
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                          listWishlist.length,
                          (index) => ProductCard(
                            wishlistModel: listWishlist[index],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        );
      });
    });
  }
}

Widget itemDeleteBg() {
  return Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 10),
    color: Colors.red,
    child: const Icon(
      Icons.delete,
      color: Colors.white,
    ),
  );
}

class ProductCard extends StatelessWidget {
  WishlistModel wishlistModel;
  ProductCard({Key? key, required this.wishlistModel}) : super(key: key);
  Widget quantityRegulator() {
    return Container(
        alignment: Alignment.center,
        height: getProportionateScreenHeight(30),
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(7.1)),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(2)),
        child: const Text(
          "Out of Stock",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
        ));
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: wishlistModel.press,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(16)),
        child: Container(
          height: getProportionateScreenHeight(120),
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                height: getProportionateScreenHeight(120),
                width: getProportionateScreenHeight(120),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(wishlistModel.image),
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
                            wishlistModel.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: normal),
                          ),
                          Text(
                            "\$" + wishlistModel.price.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: normal,
                                color: primaryColor),
                          ),
                        ]),
                    //SizedBox(height: getProportionateScreenHeight(3),),

                    Container(
                        alignment: Alignment.center,
                        height: getProportionateScreenHeight(30),
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(7.1)),
                        decoration: BoxDecoration(
                            color: wishlistModel.isInStock
                                ? primaryColor
                                : const Color(0xffFFB900),
                            borderRadius: BorderRadius.circular(2)),
                        child: Text(
                          wishlistModel.isInStock ? "In Stock" : "Out of Stock",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ))
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
