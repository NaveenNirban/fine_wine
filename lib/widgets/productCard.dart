import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:fine_wine/models/HomeTab/productSection.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductSectionModel productSectionModel;
  ProductCard({required this.productSectionModel});

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
                Text(productSectionModel.sectionTitle,
                    style: TextStyle(
                        fontSize: homeTitleSize, fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () {},
                  child: Text("See All",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(32),
          ),
          Container(
            height: getProportionateScreenHeight(370),
            child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children:
                    List.generate(productSectionModel.products.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //////////////////////////////

                        Container(
                          //padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                          height: getProportionateScreenHeight(240),
                          width: getProportionateScreenWidth(164),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFECDF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            productSectionModel.products[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(productSectionModel.products[index].name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: getProportionateScreenHeight(3),
                        ),
                        Text(productSectionModel.products[index].category,
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff929292))),
                        SizedBox(
                          height: getProportionateScreenHeight(3),
                        ),
                        Text(
                            "\$" +
                                productSectionModel.products[index].price
                                    .toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: primaryColor)),

/////////////////////////////////////////////////////////
                      ],
                    ),
                  );
                })),
          )
        ]);
  }
}
