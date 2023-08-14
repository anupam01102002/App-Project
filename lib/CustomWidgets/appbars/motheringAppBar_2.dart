import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mothering_app/Screens/Shopping%20Section%20Screen/shopping.dart';

class motheringAppBar_2 extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Mothering_Text.png',
            width: 80.0,
            height: 80.0,
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(243, 149, 96, 1),
              Color.fromRGBO(251, 170, 124, 1),
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
          badgeContent: Text('3'),
          child: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingScreen()),
              );
            },
          ),
        ),
        badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(206, 217, 255, 1),
          ),
          position: badges.BadgePosition.topEnd(top: -3, end: -1),
          badgeContent: Text('3'),
          child: IconButton(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications),
            onPressed: () {
              // Add your notifications icon functionality here
            },
          ),
        ),
        badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(206, 217, 255, 1),
          ),
          position: badges.BadgePosition.topEnd(top: -3, end: -1),
          badgeContent: Text('3'),
          child: IconButton(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            onPressed: () {
              // Add your favorites icon functionality here
            },
          ),
        ),
        badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Color.fromRGBO(206, 217, 255, 1),
          ),
          position: badges.BadgePosition.topEnd(top: -3, end: -1),
          badgeContent: Text('3'),
          child: IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Add your cart icon functionality here
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
