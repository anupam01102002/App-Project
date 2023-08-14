import 'package:flutter/material.dart';
import 'package:mothering_app/profile.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MotheringAppBarDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(124, 218, 252, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      // Add profile icon image here
                      // backgroundImage: AssetImage('assets/profile_image.png'),
                      // Use the above line if you have a custom profile image
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Color.fromRGBO(124, 218, 252, 1),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'User Name',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'EmailId',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ), // Replace with the desired icon
                      onPressed: () {
                        pushNewScreen(
                          context,
                          screen: MyProfile(),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Material(
              elevation: 4, // Set the desired elevation value
              child: Container(
                height:
                    50, // Set the total height of the icons row container to 50
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width:
                              32, // Adjust the width of the SizedBox as needed
                          height:
                              32, // Adjust the height of the SizedBox as needed
                          child: IconButton(
                            icon: const Icon(
                              Icons.person,
                              color: Color.fromRGBO(150, 150, 150, 1),
                              size: 20,
                            ),
                            onPressed: () {
                              // Handle Home icon tap
                            },
                          ),
                        ),
                        const Flexible(
                          child: Text(
                            'Account',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromRGBO(150, 150, 150, 1),
                                fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width:
                              32, // Adjust the width of the SizedBox as needed
                          height:
                              32, // Adjust the height of the SizedBox as needed
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/Vector_orderHistory.png',
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                            onPressed: () {
                              // Handle Shop icon tap
                            },
                          ),
                        ),
                        const Flexible(
                          child: Text(
                            'Order History',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromRGBO(150, 150, 150, 1),
                                fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width:
                              32, // Adjust the width of the SizedBox as needed
                          height:
                              32, // Adjust the height of the SizedBox as needed
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/Vector_trackorder.png',
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                            onPressed: () {
                              // Handle History icon tap
                            },
                          ),
                        ),
                        const Flexible(
                          child: Text(
                            'Track Order',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromRGBO(150, 150, 150, 1),
                                fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width:
                              32, // Adjust the width of the SizedBox as needed
                          height:
                              32, // Adjust the height of the SizedBox as needed
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/Vector_cashrefund.png',
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                            onPressed: () {
                              // Handle Search icon tap
                            },
                          ),
                        ),
                        const Flexible(
                          child: Text(
                            'Cash Refund',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromRGBO(150, 150, 150, 1),
                                fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: const Icon(
                  Icons.home,
                  size: 20,
                ),
                title: const Text('Home'),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: const Icon(
                  Icons.notifications,
                  size: 20,
                ),
                title: const Text('Notification'),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: const Icon(
                  Icons.label,
                  size: 20,
                ),
                title: const Text('Offer Zone'),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: const Icon(
                  Icons.favorite,
                  size: 20,
                ),
                title: const Text(
                  'Mothering',
                  style: TextStyle(
                    color: Color.fromRGBO(124, 218, 252, 1),
                  ),
                ),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Image.asset(
                    'assets/images/Vector_babyhug.png',
                    height: 18,
                    width: 18,
                    fit: BoxFit.contain,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/Vector_babyhug_title.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Image.asset(
                    'assets/images/Vector_babyhug.png',
                    height: 18,
                    width: 18,
                    fit: BoxFit.contain,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/Vector_babyhug_title.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: const Column(
                  children: [
                    Text(
                      'My Activity',
                    ),
                  ],
                ),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: const Text(
                  'Shop By Category',
                ),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Image.asset(
                    'assets/images/Vector_babyhug.png',
                    height: 18,
                    width: 18,
                    fit: BoxFit.contain,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/Vector_babyhug_title.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.contain,
                    ),
                    const Icon(Icons.add)
                  ],
                ),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Image.asset(
                    'assets/images/Vector_babyhug.png',
                    height: 18,
                    width: 18,
                    fit: BoxFit.contain,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/Vector_babyhug_title.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.contain,
                    ),
                    const Icon(Icons.add)
                  ],
                ),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: const Icon(
                  Icons.star,
                  size: 20,
                ),
                title: const Text('Rate this App'),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: const Icon(
                  Icons.share,
                  size: 20,
                ),
                title: const Text('Share this app'),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: const Icon(
                  Icons.headphones,
                  size: 20,
                ),
                title: const Text('Support'),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: Image.asset(
                  'assets/images/Vector_policies.png',
                  height: 18,
                  width: 18,
                  fit: BoxFit.contain,
                ),
                title: const Text('Policies'),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
            Container(
              height: 30, // Set the height of the ListTile to 15
              child: ListTile(
                leading: const Icon(
                  Icons.handshake,
                  size: 20,
                ),
                title: const Text('Sell with us'),
                onTap: () {
                  // Handle Home item tap
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
