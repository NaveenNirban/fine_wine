import 'package:fine_wine/services/userPreferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'welcome.dart';

class PreHome extends StatefulWidget {
  const PreHome({Key? key}) : super(key: key);

  @override
  _PreHomeState createState() => _PreHomeState();
}

class _PreHomeState extends State<PreHome> {
  Future getUserData() {
    return UserPreferences().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.data?.token == null) {
              if (kDebugMode) {
                print("token null");
              }
              return WelcomeScreen();
            } else {
              UserPreferences().removeUser();
              if (kDebugMode) {
                print("Token present");
              }
              return HomeScreen(
                user: snapshot.data,
                key: const Key("home"),
                selectedIndex: 0,
              );
            }
        }
      },
    );
  }
}
