import 'package:bukbazarr/provider/Authprovider.dart';
import 'package:bukbazarr/view/login.dart';
import 'package:bukbazarr/view/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class checkscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final checkislogin = Provider.of<AuthProvider>(context);
    return MaterialApp(
      home: FutureBuilder<bool>(
        future: checkislogin.checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            // user is logged in, navigate to main page
            return const MainScreen();
          } else {
            // user is not logged in, navigate to login page
            return loginPage();
          }
        },
      ),
    );
  }
}
