import 'package:bukbazarr/provider/Authprovider.dart';
import 'package:bukbazarr/provider/Booksprovider.dart';
import 'package:bukbazarr/splash/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => Booksprovider()),
      ],
      child: MaterialApp(
        title: 'BukBazarr',
        home: splashscreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
