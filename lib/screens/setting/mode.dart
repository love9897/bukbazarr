import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting {
  final String title;
  final String route;
  final IconData icon;

  Setting({
    required this.title,
    required this.route,
    required this.icon,
  });
}

final List<Setting> settings = [
  Setting(
    title: "Personal Data",
    route: "/",
    icon: CupertinoIcons.person_fill,
  ),
  Setting(
    title: "Settings",
    route: "/",
    icon: Icons.settings,
  ),
  Setting(
    title: "Logout",
    route: "logout",
    icon: Icons.logout_outlined,
  ),
];

final List<Setting> settings2 = [
  Setting(
    title: "FAQ",
    route: "/",
    icon: CupertinoIcons.ellipsis_vertical_circle_fill,
  ),
  Setting(
    title: "About",
    route: "/",
    icon: CupertinoIcons.person_3_fill,
  ),
];
