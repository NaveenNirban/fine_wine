import 'package:fine_wine/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatefulWidget {
  const FormError({
    required Key key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  _FormErrorState createState() => _FormErrorState();
}

class _FormErrorState extends State<FormError> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: List.generate(widget.errors.length,
          (index) => formErrorText(error: widget.errors[index])),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenWidth(14.0),
          width: getProportionateScreenWidth(14.0),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10.0),
        ),
        Text(error),
      ],
    );
  }
}
