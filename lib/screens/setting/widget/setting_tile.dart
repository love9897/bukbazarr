import 'package:bukbazarr/provider/Authprovider.dart';
import 'package:bukbazarr/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../mode.dart';

class SettingTile extends StatelessWidget {
  final Setting setting;
  const SettingTile({
    super.key,
    required this.setting,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return GestureDetector(
      onTap: () {
        if (setting.route == "logout") {
          authProvider.logOut();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => loginPage()),
            (route) => false,
          );
        }
      }, // Navigation
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: klightContentColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(setting.icon, color: kprimaryColor),
          ),
          const SizedBox(width: 10),
          Text(
            setting.title,
            style: const TextStyle(
              color: kprimaryColor,
              fontSize: ksmallFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Icon(
            CupertinoIcons.chevron_forward,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}
