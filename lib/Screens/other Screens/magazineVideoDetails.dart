import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/commentBox.dart';
import 'package:mothering_app/CustomWidgets/subtitle.dart';
import 'package:mothering_app/Screens/NavBarScreens/magazine_stories.dart';

class MagazineVideoDetails extends StatefulWidget {
  final String imageUrl;

  MagazineVideoDetails({
    required this.imageUrl,
  });

  @override
  State<MagazineVideoDetails> createState() => _MagazineVideoDetailsState();
}

class _MagazineVideoDetailsState extends State<MagazineVideoDetails> {
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MotheringMagazineScreen_Stories()),
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
                      onPressed: null,
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
              containerWidth: 8,
              enterText: 'Related Shows',
              textColor: Color.fromRGBO(0, 124, 168, 1),
              containerColor: Color.fromRGBO(0, 124, 168, 1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.35,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MagazineFeaturedContainer(
                        imageUrl_Shows: 'imageUrl_Shows',
                        SpotlightDetails: 'SpotlightDetails',
                        SpotlightTitle: 'SpotlightTitle',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MagazineVideoDetails(
                                  imageUrl: 'assets/images/Toddler_1.png'),
                            ),
                          );
                        },
                      ),
                      MagazineFeaturedContainer(
                        imageUrl_Shows: 'imageUrl_Shows',
                        SpotlightDetails: 'SpotlightDetails',
                        SpotlightTitle: 'SpotlightTitle',
                        onPressed: () {},
                      ),
                      MagazineFeaturedContainer(
                        imageUrl_Shows: 'imageUrl_Shows',
                        SpotlightDetails: 'SpotlightDetails',
                        SpotlightTitle: 'SpotlightTitle',
                        onPressed: () {},
                      ),
                      MagazineFeaturedContainer(
                        imageUrl_Shows: 'imageUrl_Shows',
                        SpotlightDetails: 'SpotlightDetails',
                        SpotlightTitle: 'SpotlightTitle',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
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

class MagazineFeaturedContainer extends StatelessWidget {
  final String imageUrl_Shows;
  final String SpotlightTitle;
  final String SpotlightDetails;
  final double borderRadius;
  final VoidCallback onPressed;

  MagazineFeaturedContainer({
    required this.imageUrl_Shows,
    required this.SpotlightDetails,
    required this.SpotlightTitle,
    required this.onPressed,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Container(
        width: 150,
        height: 200,
        color: Colors.grey[200],
        child: Stack(
          children: [
            Image.asset(
              'assets/images/Add_1.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    color: const Color.fromRGBO(116, 116, 116, 0.7),
                    child: const Text(
                      'Sample Text',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: onPressed,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(116, 116, 116, 0.7),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Watch Now',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
