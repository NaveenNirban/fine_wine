import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:fine_wine/models/categories/categorySectionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatefulWidget {
  CategorySectionModel cardSectionModel;
  //BuildContext contextCategory;
  CategoryCard({Key? key, required this.cardSectionModel}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //title
                Text(widget.cardSectionModel.title,
                    style: TextStyle(
                        fontSize: homeTitleSize, fontWeight: FontWeight.bold)),
                Container()
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(32),
          ),
          SizedBox(
            height: getProportionateScreenHeight(90),
            child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: List.generate(
                    widget.cardSectionModel.categories.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15)),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/category',
                          arguments: {
                            "category":
                                widget.cardSectionModel.categories[index].name
                          }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //////////////////////////////

                          Container(
                              alignment: Alignment.center,
                              height: getProportionateScreenHeight(60),
                              width: getProportionateScreenWidth(60),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color(0xff242424).withAlpha(13),
                                    offset: const Offset(0.0, 5.0), //(x,y)
                                    blurRadius: 20.0,
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                width: getProportionateScreenWidth(30),
                                child: SvgPicture.asset(
                                  widget
                                      .cardSectionModel.categories[index].image,
                                ),
                              )),
                          SizedBox(height: getProportionateScreenHeight(15)),
                          Text(
                            widget.cardSectionModel.categories[index].name,
                            style: const TextStyle(fontSize: 12),
                          )

/////////////////////////////////////////////////////////
                        ],
                      ),
                    ),
                  );
                })),
          )
        ]);
  }
}
