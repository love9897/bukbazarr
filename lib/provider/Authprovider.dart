import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  DateTime backPressedTime = DateTime.now();

  void Toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    ));
    notifyListeners();
  }

  Future<bool> backscreenpop(BuildContext context) async {
    final difference = DateTime.now().difference(backPressedTime);
    backPressedTime = DateTime.now();

    if (difference >= const Duration(seconds: 2)) {
      Toast(context, "Click Again to close the app");
      notifyListeners();

      return false;
    } else {
      SystemNavigator.pop(animated: true);
      return true;
    }
  }

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void storeLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
    notifyListeners();
  }

  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    notifyListeners();
    return isLoggedIn;
  }


  // 




  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<void> logOut() async {
    await _auth.signOut();
    _currentUser = null;
    notifyListeners();
  }

  Future<void> checkCurrentUser() async {
    _currentUser = _auth.currentUser;
    notifyListeners();
  }
}
