import 'package:flutter/material.dart';

import '../constants.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "image/avatar.png",
          width: 80,
          height: 80,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Anonymous",
              style: TextStyle(
                fontSize: kbigFontSize,
                fontWeight: FontWeight.bold,
                color: kprimaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
