import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class motheringAppBar_3 extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/MSocial_text.png',
            width: 80.0,
            height: 80.0,
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 115, 114, 1),
              Color.fromRGBO(208, 71, 103, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      actions: <Widget>[
        badges.Badge(
          showBadge: false,
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(206, 217, 255, 1),
          ),
          position: badges.BadgePosition.topEnd(top: -3, end: -1),
          badgeContent: const Text('3'),
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(206, 217, 255, 1),
          ),
          position: badges.BadgePosition.topEnd(top: 0, end: 5),
          badgeContent: const Text('3'),
          child: IconButton(
            icon: const Icon(Icons.notifications_outlined),
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
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: const Center(
              child: Text(
                'Mothering',
                style: TextStyle(
                    color: Color.fromRGBO(208, 71, 103, 1),
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
