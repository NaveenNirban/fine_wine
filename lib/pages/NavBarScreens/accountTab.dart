import 'package:fine_wine/config/size_config.dart';
import 'package:fine_wine/constants/constants.dart';
import 'package:fine_wine/models/accounts_tab/accounts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountTabScreen extends StatefulWidget {
  @override
  _AccountTabScreenState createState() => _AccountTabScreenState();
}

class _AccountTabScreenState extends State<AccountTabScreen> {
  List<AccountsTabModel> listOptions = [
    AccountsTabModel(
        image: "assets/icons/accounts/edit_profile.svg",
        title: "Edit Profile",
        route: 'edit_profile'),
    AccountsTabModel(
        image: "assets/icons/accounts/location.svg",
        title: "Shipping Address",
        route: 'shipping_address'),
    AccountsTabModel(
        image: "assets/icons/accounts/wishlist.svg",
        title: "Wishlist",
        route: 'wishlist'),
    AccountsTabModel(
        image: "assets/icons/accounts/order_history.svg",
        title: "Order History",
        route: 'order_history'),
  ];

  Widget logoutButton(context, Size size) {
    return SizedBox(
      width: size.width * 0.3,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          //onPrimary: Color(0xFF00C569),
        ),
        child: const Text(
          "LOGOUT",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        onPressed: () {
          //Navigator.pushNamed(context, '/payments');
        },
      ),
    );
  }

  Widget cancelButton(context, Size size) {
    return SizedBox(
      width: size.width * 0.3,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: const BorderSide(color: primaryColor)),
          //onPrimary: Color(0xFF00C569),
        ),
        child: const Text(
          "CANCEL",
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        onPressed: () {
          //Navigator.pop(context);
        },
      ),
    );
  }

  Widget profileBar() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              width: getProportionateScreenWidth(120),
              height: getProportionateScreenHeight(120),
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(26.0)),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1495609051331-23a311cc40fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1948&q=80"),
                      fit: BoxFit.fill))),
          SizedBox(
            width: getProportionateScreenWidth(30),
          ),
          Column(
            //mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "David Spade",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: getProportionateScreenHeight(9),
              ),
              SizedBox(
                width: getProportionateScreenWidth(180),
                child: const Text(
                  "Naveennirbanyadav08@gmail.com",
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget accountOptions() {
    return Column(
      children: List.generate(listOptions.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/' + listOptions[index].route);
            },
            child: SizedBox(
              height: getProportionateScreenHeight(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    Container(
                        width: getProportionateScreenWidth(40),
                        height: getProportionateScreenWidth(40),
                        decoration: BoxDecoration(
                          color: const Color(0xff00C569).withAlpha(7),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Container(
                            alignment: Alignment.center,
                            height: 10,
                            width: 10,
                            child: SvgPicture.asset(listOptions[index].image))),
                    SizedBox(
                      width: getProportionateScreenWidth(15),
                    ),
                    Text(
                      listOptions[index].title,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ]),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                        "assets/icons/accounts/right_arrow.svg"),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget logout(Size size) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(24)),
                    child: Container(
                      alignment: Alignment.center,
                      height: getProportionateScreenWidth(140),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: CupertinoColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Do you wish to Logout?",
                              style: TextStyle(fontSize: 18),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                cancelButton(context, size),
                                logoutButton(context, size),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
          // Navigator.pushNamed(context,'/'+listOptions[index].route);
        },
        child: SizedBox(
          height: getProportionateScreenHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Container(
                    width: getProportionateScreenWidth(40),
                    height: getProportionateScreenWidth(40),
                    decoration: BoxDecoration(
                      color: const Color(0xff00C569).withAlpha(7),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: Container(
                        alignment: Alignment.center,
                        height: 10,
                        width: 10,
                        child: SvgPicture.asset(
                            'assets/icons/accounts/logout.svg'))),
                SizedBox(
                  width: getProportionateScreenWidth(15),
                ),
                const Text(
                  "LogOut",
                  style: TextStyle(fontSize: 18),
                ),
              ]),
              Container(
                alignment: Alignment.centerLeft,
                width: 24,
                height: 24,
                child:
                    SvgPicture.asset("assets/icons/accounts/right_arrow.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(30),
            horizontal: getProportionateScreenWidth(16)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              profileBar(),
              SizedBox(
                height: getProportionateScreenHeight(26),
              ),
              accountOptions(),
              logout(size)
            ]),
      ),
    ));
  }
}

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.image,
  }) : super(key: key);

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: const EdgeInsets.only(top: Consts.avatarRadius),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const ContinuousRectangleBorder(),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
