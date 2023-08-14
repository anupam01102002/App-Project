import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_4.dart';
import 'package:mothering_app/CustomWidgets/magazineStoriesContainer.dart';
import 'package:mothering_app/CustomWidgets/motheringAppBarDrawer.dart';
import 'package:mothering_app/CustomWidgets/subtitle.dart';
import 'package:mothering_app/Screens/NavBarScreens/magazine_videos.dart';
import 'package:mothering_app/Screens/other%20Screens/magazineStoryDetails.dart';

class MotheringMagazineScreen_Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: motheringAppBar_4(),
      drawer: MotheringAppBarDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: const BorderSide(
                            color: Colors.blue,
                          ), // Set border color to blue
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 40.0),
                        primary: Colors.white, // Set button color to white
                      ),
                      child: const Text(
                        'Stories',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue, // Set text color to blue
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MotheringMagazineScreen_Videos()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: const BorderSide(
                              color: Colors.blue), // Set border color to blue
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 40.0),
                        primary: Colors.white, // Set button color to white
                      ),
                      child: const Text(
                        'Videos',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue, // Set text color to blue
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/Magazine_1.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Subtitle(
                containerHeight: 40,
                containerWidth: 8,
                enterText: 'Spotlight',
                textColor: Color.fromRGBO(0, 124, 168, 1),
                containerColor: Color.fromRGBO(0, 124, 168, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Container(
                color: const Color.fromRGBO(235, 235, 235, 1),
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.40,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MagazineSpotlightContainer(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MagazineStoryDetails(
                                  imageUrl: 'assets/images/Toddler_1.png'),
                            ),
                          );
                        },
                        SpotlightDetails:
                            'Activities that will wear down your high powered Toddler',
                        SpotlightTitle: 'Toddler',
                        imageUrl_stories: 'assets/images/Toddler_1.png',
                      ),
                      MagazineSpotlightContainer(
                        onPressed: () {},
                        SpotlightDetails:
                            'Activities that will wear down your high powered Toddler',
                        SpotlightTitle: 'Toddler',
                        imageUrl_stories: 'assets/images/Toddler_1.png',
                      ),
                      MagazineSpotlightContainer(
                        onPressed: () {},
                        SpotlightDetails:
                            'Activities that will wear down your high powered Toddler',
                        SpotlightTitle: 'Toddler',
                        imageUrl_stories: 'assets/images/Toddler_1.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MagazineStoriesContainer(
              imageUrl_stories: 'assets/images/Toddler_1.png',
              StoryDetails:
                  'Activities that will wear down your high powered Toddler',
              StoryTitle: 'Toddler',
            ),
            MagazineStoriesContainer(
              imageUrl_stories: 'assets/images/Toddler_1.png',
              StoryDetails:
                  'Activities that will wear down your high powered Toddler',
              StoryTitle: 'Toddler',
            ),
            MagazineStoriesContainer(
              imageUrl_stories: 'assets/images/Toddler_1.png',
              StoryDetails:
                  'Activities that will wear down your high powered Toddler',
              StoryTitle: 'Toddler',
            ),
            MagazineStoriesContainer(
              imageUrl_stories: 'assets/images/Toddler_1.png',
              StoryDetails:
                  'Activities that will wear down your high powered Toddler',
              StoryTitle: 'Toddler',
            ),
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class MagazineSpotlightContainer extends StatelessWidget {
  final String imageUrl_stories;
  final String SpotlightTitle;
  final String SpotlightDetails;
  final double borderRadius;
  final VoidCallback onPressed;

  MagazineSpotlightContainer({
    required this.imageUrl_stories,
    required this.SpotlightDetails,
    required this.SpotlightTitle,
    required this.onPressed,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
      child: Column(
        children: [
          Container(
            width: 240,
            height: 110,
            child: ClipRRect(
              child: Image.asset(
                imageUrl_stories,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: 240,
            child: ClipRRect(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    SpotlightTitle,
                    style: const TextStyle(
                        color: Color.fromRGBO(130, 212, 249, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  SpotlightDetails,
                  style: const TextStyle(),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: onPressed,
                  child: const Text(
                    'Read More',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 151, 219, 1),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
