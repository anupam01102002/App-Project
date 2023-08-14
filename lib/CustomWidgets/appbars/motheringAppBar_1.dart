import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class MotheringAppBar_1 extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: Colors.white,
            // Add profile icon image here
            // backgroundImage: AssetImage('assets/profile_image.png'),
            // Use the above line if you have a custom profile image
            child: Icon(
              Icons.person,
              size: 20,
              color: Color.fromRGBO(124, 218, 252, 1),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Shop For',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'All',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(124, 218, 252, 1),
      actions: <Widget>[
        badges.Badge(
          showBadge: false,
          position: badges.BadgePosition.topEnd(top: -3, end: -1),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(255, 122, 122, 1),
          ),
          badgeContent: const Text(
            '3',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: -3, end: -1),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(255, 122, 122, 1),
          ),
          badgeContent: const Text(
            '3',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications_outlined),
            selectedIcon: const Icon(Icons.notifications),
            onPressed: () {
              // Add your notifications icon functionality here
            },
          ),
        ),
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: -3, end: -1),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(255, 122, 122, 1),
          ),
          badgeContent: const Text(
            '3',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.favorite_border),
            selectedIcon: const Icon(Icons.favorite),
            onPressed: () {
              // Add your favorites icon functionality here
            },
          ),
        ),
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: -3, end: -1),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(255, 122, 122, 1),
          ),
          badgeContent: const Text(
            '3',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            selectedIcon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Add your cart icon functionality here
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
