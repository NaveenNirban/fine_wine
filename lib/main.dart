import 'package:fine_wine/routes/router.dart' as router;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'services/authProvider.dart';
import 'services/userProvider.dart';
//final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(MyApp());
  /*SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
      )
  );*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
                title: 'Fine Wine',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  /*brightness: Brightness.light,*/
                  fontFamily: 'SfPro',
                  primaryColor: const Color(0xFF00C569),
                ),
                initialRoute: router.Router.preHome,
                onGenerateRoute: router.Router.generateRoute);
          });
        });
      }),
    );
  }
}
