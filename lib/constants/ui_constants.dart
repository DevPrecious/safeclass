import 'package:flutter/material.dart';
import 'package:nsafeclass/theme/pallete.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UIConstants {
  static AppBar authAppBar() {
    return AppBar(
      leading: InkWell(
        onTap: () {},
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Pallete.activePurpleColor,
              ),
              child: SvgPicture.asset(
                'assets/svgs/call.svg',
              ),
            ),
          ),
        )
      ],
    );
  }

  // static List<Widget> bottomTabBarPages = [
  //   Text('Feed Screen'),
  //   Text('Search Screen'),
  //   Text('Notification Screen'),
  // ];
}
