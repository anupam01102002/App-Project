import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mothering_app/Screens/other%20Screens/MSocialCommentBox.dart';
import 'package:mothering_app/Screens/other%20Screens/mSocialProfilepage.dart';

class MSocialPosts extends StatefulWidget {
  final String imagePath;
  final String userName;
  final String userDescription;
  final DateTime postTime;

  const MSocialPosts({
    required this.imagePath,
    required this.userName,
    required this.userDescription,
    required this.postTime,
  });

  @override
  State<MSocialPosts> createState() => _MSocialPostsState();
}

class _MSocialPostsState extends State<MSocialPosts> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.MMMEd().format(widget.postTime);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 241, 241, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MSocialProfileScreen()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 13,
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      // Add profile icon image here
                      // backgroundImage: AssetImage('assets/profile_image.png'),
                      // Use the above line if you have a custom profile image
                      child: Icon(
                        Icons.person,
                        size: 25,
                        color: Color.fromRGBO(255, 241, 241, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.userName,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        widget.userDescription,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(150, 150, 150, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(formattedDate),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(),
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 241, 241, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.remove_red_eye,
                    color: Color.fromRGBO(90, 90, 90, 1),
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '2 views',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MSocialCommentBox()),
                            );
                          },
                          icon: const Icon(
                            Icons.message_outlined,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook,
                      size: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.wechat_sharp,
                      size: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Share'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
