import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopBar extends StatelessWidget{
  String title;
  TopBar(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
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
              title,
              style: TextStyle(fontSize: 20),
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
}