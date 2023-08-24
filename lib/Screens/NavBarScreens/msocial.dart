import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_3.dart';
import 'package:mothering_app/CustomWidgets/mSocialHashtags.dart';
import 'package:mothering_app/CustomWidgets/mSocialPost.dart';
import 'package:mothering_app/CustomWidgets/app_drawer/motheringAppBarDrawer.dart';

class MotheringMsocialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 178, 177, 1),
        appBar: motheringAppBar_3(),
        drawer: MotheringAppBarDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MSocialHashtags(
                hashTags: [
                  'hashTags',
                  'afdasf',
                  'afsasasfa',
                  'faasffasfsaef',
                  'sfedafefaf',
                  'dfgde'
                ],
              ),
              MSocialPosts(
                imagePath: 'assets/images/post_1.png',
                userName: 'Dr. Disha Patel',
                userDescription: 'Mom of a 2 m old girl',
                postTime: DateTime.now(),
              ),
              MSocialPosts(
                imagePath: 'assets/images/post_1.png',
                userName: 'Dr. Disha Patel',
                userDescription: 'Mom of a 2 m old girl',
                postTime: DateTime.now(),
              ),
              MSocialPosts(
                imagePath: 'assets/images/post_1.png',
                userName: 'Dr. Disha Patel',
                userDescription: 'Mom of a 2 m old girl',
                postTime: DateTime.now(),
              ),
            ],
          ),
        ));
  }
}
