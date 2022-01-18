import 'dart:math' as math;

import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Widget bottomNavBar(Size size, context) {
    return Container(
      height: getProportionateScreenHeight(84),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 1),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "PRICE",
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
    return SizedBox(
      width: size.width * 0.4,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF00C569),
          //onPrimary: Color(0xFF00C569),
        ),
        child: const Text(
          "ADD",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/home', arguments: {"navBarItem": "1"});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: bottomNavBar(size, context),
      body: CollapsingList(
        context1: context,
        key: const Key("collapse"),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatefulWidget {
  BuildContext context1;
  CollapsingList({required Key key, required this.context1}) : super(key: key);
  @override
  _CollapsingListState createState() => _CollapsingListState();
}

class _CollapsingListState extends State<CollapsingList> {
  final generatedList = List.generate(50, (index) => 'Item $index');
  IconData favOrNot = Icons.star_border;
  Color favBtnColor = Colors.black;

  List<Map<String, dynamic>> productsData = [
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

  List<Map<String, dynamic>> reviewsData = [
    {
      "image":
          "https://unsplash.com/photos/155huuQwGvA/download?force=true&w=640",
      "name": "Samuel Smith",
      "comment":
          "Wonderful jean, perfect gift for my girl for our anniversary!uyhjgkuyergfuywfukjhvewu efuwykgf wueyfg uweky fguweqy gfqkuw kfuwey gfkuqwyegfukywe gfkquwye gfuk wyeg fkwgfuwkyefgwuefyg qwuyfweqgufkygweufy kgqwufkywgufgw",
      "stars": 4
    },
    {
      "image":
          "https://unsplash.com/photos/155huuQwGvA/download?force=true&w=640",
      "name": "Samuel Smith",
      "comment":
          "Wonderful jean, perfect gift for my girl for our anniversary!",
      "stars": 4
    },
    {
      "image":
          "https://unsplash.com/photos/3OZr-hLbsq0/download?force=true&w=640",
      "name": "Samuel Smith",
      "comment":
          "Wonderful jean, perfect gift for my girl for our anniversary!",
      "stars": 4
    },
    {
      "image":
          "https://unsplash.com/photos/3OZr-hLbsq0/download?force=true&w=640",
      "name": "Samuel Smith",
      "comment":
          "Wonderful jean, perfect gift for my girl for our anniversary!",
      "stars": 4
    },
  ];

  SliverChildListDelegate bottomPortion(context) {
    return SliverChildListDelegate([
      Text(
        "Nike Dri-FIT Long Sleeve",
        style: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: getProportionateScreenHeight(20),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: getProportionateScreenWidth(160),
            height: getProportionateScreenHeight(40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 1, color: const Color(0xFFEBEBEB))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Size",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "XL",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: getProportionateScreenWidth(160),
            height: getProportionateScreenHeight(40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 1, color: const Color(0xFFEBEBEB))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Color",
                  style: TextStyle(fontSize: 14),
                ),
                Container(
                  height: 18.0.sp,
                  width: 18.0.sp,
                  decoration: BoxDecoration(
                    color: const Color(0xFF33427D),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      SizedBox(
        height: getProportionateScreenHeight(30),
      ),
      Text(
        "Details",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0.sp),
      ),
      SizedBox(
        height: getProportionateScreenHeight(20),
      ),
      const Text(
        "Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.",
        style: TextStyle(fontSize: 13, height: 2),
      ),
      SizedBox(
        height: getProportionateScreenHeight(40),
      ),
      Text(
        "Reviews",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0.sp),
      ),
      SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      InkWell(
        onTap: () {
          //.pushNamed() not working
          Navigator.pushNamed(widget.context1, '/review');
          /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReviewScreen())
          );*/
        },
        child: const Text(
          "Write your review",
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 14, color: primaryColor),
        ),
      ),
    ]);
  }

  SliverChildBuilderDelegate reviewsList(context) {
    return SliverChildBuilderDelegate(
        (context, index) => ReviewCard(
              image: reviewsData[index]["image"],
              name: reviewsData[index]["name"],
              comment: reviewsData[index]["comment"],
              stars: reviewsData[index]["stars"],
              press: reviewsData[index]["press"],
              key: const Key("review1"),
            ),
        childCount: reviewsData.length > 4 ? 4 : reviewsData.length);
  }

  Widget customBodyScrollView(Size size, context) {
    return CustomScrollView(
      slivers: <Widget>[
        makeHeader(size),
        SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(16),
              vertical: getProportionateScreenHeight(20)),
          sliver: SliverList(delegate: bottomPortion(context)),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(16),
          ),
          sliver: SliverList(
            delegate: reviewsList(context),
          ),
        )
      ],
    );
  }

  SliverPersistentHeader makeHeader(Size size) {
    return SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: _SliverAppBarDelegate(
          minHeight: getProportionateScreenHeight(152),
          maxHeight: size.height * 0.6,
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://unsplash.com/photos/iVAs1Y_C8qI/download?force=true&w=640",
                      ),
                      fit: BoxFit.fitWidth)),
              child: SafeArea(
                  child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset("assets/icons/Back ICon.svg"),
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                color: Colors.white),
                            child: IconButton(
                              icon: Icon(
                                favOrNot,
                                color: favBtnColor,
                              ),
                              tooltip: "Add to favorite list",
                              onPressed: () {
                                setState(() {
                                  favOrNot == Icons.star_border
                                      ? favOrNot = Icons.star
                                      : favOrNot = Icons.star_border;
                                  favBtnColor == Colors.black
                                      ? favBtnColor = Colors.yellow
                                      : favBtnColor = Colors.black;
                                });
                              },
                            ))
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          //SizerUtil().init(constraints, orientation);
          return SafeArea(child: customBodyScrollView(size, context));
        },
      );
    });
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    required Key key,
    required this.image,
    required this.name,
    required this.comment,
    required this.stars,
    required this.press,
  }) : super(key: key);

  final String image, name, comment;
  final int stars;
  final GestureTapCallback press;

  Widget noOfStars() {
    return Row(children: [
      for (var i = 1; i <= stars; i++)
        const Icon(
          Icons.star,
          color: Colors.yellow,
        )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Padding(
          padding: EdgeInsets.only(
              //horizontal: getProportionateScreenWidth(16),
              bottom: getProportionateScreenHeight(30)),
          child: SizedBox(
            height: getProportionateScreenHeight(85),
            width: getProportionateScreenWidth(343),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: getProportionateScreenHeight(46),
                  width: getProportionateScreenWidth(46),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(26),
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(26),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      width: getProportionateScreenWidth(271),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            noOfStars()
                          ]),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(271),
                      child: Text(
                        comment,
                        style: const TextStyle(fontSize: 14, height: 1.5),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
