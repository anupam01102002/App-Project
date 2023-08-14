import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class motheringAppBar_4 extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Color.fromRGBO(124, 218, 252, 1)),
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Magazine_logo.png',
            width: 80.0,
            height: 80.0,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      actions: <Widget>[
        badges.Badge(
          showBadge: false,
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(124, 218, 252, 1),
          ),
          position: badges.BadgePosition.topEnd(top: -3, end: -1),
          badgeContent: const Text('3'),
          child: IconButton(
            icon: const Icon(Icons.search),
            color: Color.fromRGBO(124, 218, 252, 1),
            onPressed: () {},
          ),
        ),
        badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(124, 218, 252, 1),
          ),
          position: badges.BadgePosition.topEnd(top: 0, end: 5),
          badgeContent: const Text(
            '3',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications),
            color: Color.fromRGBO(124, 218, 252, 1),
            selectedIcon: const Icon(Icons.notifications),
            onPressed: () {
              // Add your notifications icon functionality here
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: Container(
            height: 2,
            width: 80,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(124, 218, 252, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: const Center(
              child: Text(
                'Mothering',
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
