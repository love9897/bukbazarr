import 'dart:async';
import 'package:bukbazarr/splash/islogin.dart';
import 'package:flutter/material.dart';


class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => checkscreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "image/app-icon.png",
              height: 300.0,
              width: 300.0,
            )

            // child: Text(
            //   'Bukbazar',
            //   style: GoogleFonts.notoSerif(
            //       textStyle: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           color: Colors.white,
            //           fontSize: 44)),
            // ),
          ],
        ),
      ),
    );
  }
}
