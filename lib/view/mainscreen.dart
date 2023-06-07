import 'package:bukbazarr/screens/bookmark.dart';
import 'package:bukbazarr/screens/category.dart';
import 'package:bukbazarr/screens/home.dart';
import 'package:bukbazarr/screens/search.dart';
import 'package:bukbazarr/widgets/cardwd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:provider/provider.dart';

import '../provider/Authprovider.dart';
import '../screens/settings.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _Mainscreen(),
    );
  }
}

class _Mainscreen extends StatefulWidget {
  const _Mainscreen();

  @override
  State<_Mainscreen> createState() => __MainscreenState();
}

class __MainscreenState extends State<_Mainscreen>
    with AutomaticKeepAliveClientMixin {
  int current_index = 0;
  List<Widget> screens = const [
    Home(),
    category(),
    Search(),
    BookmarkedPage(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final toast = Provider.of<AuthProvider>(context, listen: false);
    toast.storeLoginStatus(true);

    return WillPopScope(
      onWillPop: () => toast.backscreenpop(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 135, 28),

          title: Center(child: Text('BukBazar')),
          // actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
        ),
        body: Center(
          child: screens[current_index],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Color.fromARGB(255, 255, 135, 28),
          unselectedIconTheme: IconThemeData(color: Colors.black45),
          currentIndex: current_index,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.check_box_outline_blank_rounded,
                ),
                label: "Category",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: "Search",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border,
                ),
                label: "Bookmark",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                ),
                label: "Settings",
                backgroundColor: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              current_index = index;
            });
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
