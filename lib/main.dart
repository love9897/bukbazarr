import 'package:bukbazarr/provider/bookmarkProvider.dart';
import 'package:bukbazarr/provider/firebaseprovider.dart';
import 'package:bukbazarr/provider/Authprovider.dart';
import 'package:bukbazarr/provider/Booksprovider.dart';
import 'package:bukbazarr/screens/bookmark.dart';
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
        ChangeNotifierProvider(create: (_) => GetData()),
        ChangeNotifierProvider(create: (_) => BookmarksProvider()),
      ],
      child: MaterialApp(
        title: 'BukBazarr',
        home: splashscreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          '': (context) => BookmarkedPage(),
        },
      ),
    ),
  );
}
