import 'package:fine_wine/models/user.dart';
import 'package:fine_wine/pages/NavBarScreens/accountTab.dart';
import 'package:fine_wine/pages/NavBarScreens/cartTab.dart';
import 'package:fine_wine/pages/NavBarScreens/homeTab.dart';
import 'package:fine_wine/pages/accounts/shipping.dart';
import 'package:fine_wine/pages/accounts/track_order.dart';
import 'package:fine_wine/pages/accounts/view_order.dart';
import 'package:fine_wine/pages/accounts/wishlist.dart';
import 'package:fine_wine/pages/address.dart';
import 'package:fine_wine/pages/category.dart';
import 'package:fine_wine/pages/delivery.dart';
import 'package:fine_wine/pages/home.dart';
import 'package:fine_wine/pages/preHome.dart';
import 'package:fine_wine/pages/product.dart';
import 'package:fine_wine/pages/review.dart';
import 'package:fine_wine/pages/signup.dart';
import 'package:fine_wine/pages/summary.dart';
import 'package:fine_wine/pages/verification.dart';
import 'package:fine_wine/pages/welcome.dart';
import 'package:flutter/material.dart';

class Router {
  static const String splash = '/splash';

  static const String preHome = '/preHome';
  static const String signup = '/signup';
  static const String verification = '/verification';
  static const String home = '/home';
  static const String category = '/category';
  static const String product = '/product';
  static const String review = '/review';
  static const String delivery = '/delivery';
  static const String address = '/address';
  static const String summary = '/summary';
  static const String homeTab = '/home_tab';
  static const String cartTab = '/cart_tab';
  static const String accountTab = '/account_tab';
  static const String orderHistory = '/order_history';
  static const String viewOrder = '/view_order';
  static const String shippingAddress = '/shipping_address';
  static const String wishlist = '/wishlist';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case preHome:
        //var navigateTo = settings.arguments;
        return MaterialPageRoute(builder: (context) => const PreHome());
      case signup:
        //var navigateTo = settings.arguments;
        return MaterialPageRoute(builder: (context) => const SignupScreen());
      case verification:
        return MaterialPageRoute(
            builder: (context) => const VerificationScreen());
      case home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            user: User(
                non_field_errors: [], password: '', username: '', token: ''),
            key: const Key("home1"),
            selectedIndex: 0,
          ),
        );

      case category:
        return MaterialPageRoute(builder: (context) => CategoryScreen());
      case product:
        return MaterialPageRoute(builder: (context) => ProductScreen());
      case review:
        return MaterialPageRoute(builder: (context) => ReviewScreen());
      case delivery:
        return MaterialPageRoute(builder: (context) => DeliveryScreen());
      case address:
        return MaterialPageRoute(builder: (context) => const AddressScreen());
      case summary:
        return MaterialPageRoute(builder: (context) => SummaryScreen());

      /// Tab Screens
      case homeTab:
        return MaterialPageRoute(builder: (context) => const HomeTabScreen());
      case cartTab:
        return MaterialPageRoute(builder: (context) => CartTabScreen());
      case accountTab:

        /// Order screens
        return MaterialPageRoute(builder: (context) => AccountTabScreen());
      case orderHistory:
        return MaterialPageRoute(
            builder: (context) => const OrderHistoryScreen());
      case viewOrder:
        return MaterialPageRoute(builder: (context) => ViewOrderScreen());
      case shippingAddress:
        return MaterialPageRoute(builder: (context) => const ShippingScreen());
      case wishlist:
        return MaterialPageRoute(builder: (context) => WishListScreen());
      default:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
    }
  }
}
