import 'package:fine_wine/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  double rating = 5.0;
  Widget title() {
    return const Text("Write a review", style: TextStyle(fontSize: 20));
  }

  Widget inputFormField(String title, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 10),
        TextField(
            obscureText: isPassword,
            decoration: const InputDecoration(
              fillColor: Colors.white,
            ))
      ],
    );
  }

  Widget signUpButton(context) {
    return SizedBox(
      width: getProportionateScreenWidth(146),
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF00C569),
          //onPrimary: Color(0xFF00C569),
        ),
        child: const Text(
          "SIGN UP",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/verification');
        },
      ),
    );
  }

  Widget backArrowIcon(context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        width: 24,
        height: 24,
        child: SvgPicture.asset("assets/icons/Back ICon.svg"),
      ),
    );
  }

  Widget productName() {
    return const Text(
      "Nike Dri-FIT Long Sleeve",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
    );
  }

  //Useless
  Widget stars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.star_border,
          size: getProportionateScreenHeight(40),
          color: Colors.grey,
        ),
        Icon(
          Icons.star_border,
          size: getProportionateScreenHeight(40),
          color: Colors.grey,
        ),
        Icon(
          Icons.star_border,
          size: getProportionateScreenHeight(40),
          color: Colors.grey,
        ),
        Icon(
          Icons.star_border,
          size: getProportionateScreenHeight(40),
          color: Colors.grey,
        ),
        Icon(
          Icons.star_border,
          size: getProportionateScreenHeight(40),
          color: Colors.grey,
        )
      ],
    );
  }

  Widget noOfStars() {
    Icon normalStar = Icon(
      Icons.star_border,
      size: getProportionateScreenHeight(40),
      color: Colors.grey,
    );
    Icon highlightedStar = Icon(
      Icons.star,
      size: getProportionateScreenHeight(40),
      color: Colors.yellow,
    );
    Icon blankStar = Icon(
      Icons.star_border,
      size: getProportionateScreenHeight(40),
      color: Colors.grey,
    );
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      for (var i = 1; i <= 5; i++)
        InkWell(
            onTap: () {
              setState(() {
                blankStar = highlightedStar;
              });
            },
            child: blankStar)
    ]);
  }

  Widget inputField() {
    return const TextField(
        obscureText: false,
        maxLines: 2,
        decoration: InputDecoration(
            fillColor: Colors.white, labelText: "Tell us your experience"));
  }

  Widget sendBtn(context) {
    return SizedBox(
      //alignment: Alignment.centerRight,
      width: getProportionateScreenWidth(146),
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF00C569),
          //onPrimary: Color(0xFF00C569),
        ),
        child: const Text(
          "SEND",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }

  Widget centerElements() {
    return Column(
      children: [
        productName(),
        SizedBox(
          height: getProportionateScreenHeight(50),
        ),
        StarRating(
          rating: rating,
          onRatingChanged: (rating) => setState(() => this.rating = rating),
          color: Color(1),
        ),
        SizedBox(
          height: getProportionateScreenHeight(74),
        ),
        inputField(),
      ],
    );
  }

  Widget titleElements(context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      backArrowIcon(context),
      const Text(
        "Write Review",
        style: TextStyle(fontSize: 20),
      ),
      //Dummy widget to maintain spacebetween property
      const Text("")
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Backarrow, write a review
              Container(
                child: titleElements(context),
              ),

              //product name, stars, tell us your experience
              centerElements(),

              //Send button
              Align(
                alignment: Alignment.centerRight,
                child: sendBtn(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  const StarRating(
      {Key? key,
      this.starCount = 5,
      this.rating = .0,
      required this.onRatingChanged,
      required this.color})
      : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
        size: getProportionateScreenHeight(40),
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
        size: getProportionateScreenHeight(40),
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
        size: getProportionateScreenHeight(40),
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
