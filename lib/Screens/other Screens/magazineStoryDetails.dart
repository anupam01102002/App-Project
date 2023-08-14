import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/commentBox.dart';
import 'package:mothering_app/CustomWidgets/magazineStoriesContainer.dart';
import 'package:mothering_app/CustomWidgets/subtitle.dart';

class MagazineStoryDetails extends StatefulWidget {
  final String imageUrl;

  MagazineStoryDetails({
    required this.imageUrl,
  });

  @override
  State<MagazineStoryDetails> createState() => _MagazineStoryDetailsState();
}

class _MagazineStoryDetailsState extends State<MagazineStoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(124, 218, 252, 1),
        title: const Text('Go To Stories'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StoryDetailsContainer(
              Category: 'Toddler',
              Views: '199',
              Time: DateTime.now(),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      // Handle button 1 press
                    },
                    icon: const Icon(Icons.bookmark_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle button 2 press
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle button 3 press
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle button 4 press
                    },
                    icon: const Icon(Icons.copy),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Kids are a powerhouse of energy, excitement and curiosity and that can add up to a real challenge for you dear mommy.The world is very thrilling for 2- and 3-year-olds, and they love to delve into.',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'So here are some easy, low-prep toddler activities and games that you can organise at home that will wear your toddler out -',
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Comment',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Write Comment',
                                      hintStyle: TextStyle(fontSize: 14),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 20,
                              width: 80,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Circular borders
                                  ),
                                ),
                                child: const Text(
                                  'POST',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            const Text('Comments (1)')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MagazineCommentBox(
                Time: DateTime.now(),
                CommentContent: 'CommentContent',
                userName: 'Anupam Anand'),
            const Subtitle(
              containerHeight: 32,
              containerWidth: 6,
              enterText: 'More For You',
              textColor: Color.fromRGBO(0, 124, 168, 1),
              containerColor: Color.fromRGBO(0, 124, 168, 1),
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

class StoryDetailsContainer extends StatelessWidget {
  final String Category;
  final String Views;
  final DateTime Time;

  StoryDetailsContainer({
    required this.Time,
    required this.Views,
    required this.Category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 15,
                    color: const Color.fromRGBO(34, 200, 244, 1),
                    child: Center(
                      child: Text(
                        Category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'MOTHERING',
                    style: TextStyle(
                      color: Color.fromRGBO(34, 200, 244, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$Time',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Text(
                  Views + ' Views',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
