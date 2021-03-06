import 'package:fine_wine/services/authProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(user!.photoURL.toString()),
          ),
          const SizedBox(height: 8),
          Text(
            'Name: ' + user.displayName.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'Email: ' + user.email.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
