import 'package:flutter/material.dart';
import 'package:mothering_app/CustomWidgets/appbars/motheringAppBar_4.dart';
import 'package:mothering_app/CustomWidgets/motheringAppBarDrawer.dart';

import 'package:mothering_app/CustomWidgets/subtitle.dart';
import 'package:mothering_app/Screens/NavBarScreens/magazine_stories.dart';
import 'package:mothering_app/Screens/other%20Screens/magazineVideoDetails.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class MotheringMagazineScreen_Videos extends StatefulWidget {
  @override
  State<MotheringMagazineScreen_Videos> createState() =>
      _MotheringMagazineScreen_VideosState();
}

class _MotheringMagazineScreen_VideosState
    extends State<MotheringMagazineScreen_Videos> {
  final videoUrl = 'https://youtu.be/ROizaaDphtU';
  String? _thumbnailUrl;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
    generateThumbnail();
  }

  void generateThumbnail() async {
    _thumbnailUrl = await VideoThumbnail.thumbnailFile(
      video: 'https://youtu.be/ROizaaDphtU',
      imageFormat: ImageFormat.WEBP,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: motheringAppBar_4(),
      drawer: MotheringAppBarDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            if (_thumbnailUrl != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Thumbnail using Video url :"),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.file(File(_thumbnailUrl!)),
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black45,
                        child: Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
            const Subtitle(
              containerHeight: 32,
              containerWidth: 8,
              enterText: 'Featured',
              textColor: Color.fromRGBO(124, 218, 252, 1),
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
              height: 60,
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromRGBO(0, 124, 168, 1),
                          ), // Set border color to blue
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 40.0),
                        primary: const Color.fromRGBO(
                            135, 211, 244, 1), // Set button color to white
                      ),
                      child: const Text(
                        'FRESH',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(
                              255, 255, 255, 255), // Set text color to blue
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromRGBO(0, 124, 168, 1),
                          ), // Set border color to blue
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 40.0),
                        primary: const Color.fromRGBO(135, 211, 244, 1),
                      ),
                      child: const Text(
                        'EXPLORE',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Subtitle(
              containerHeight: 32,
              containerWidth: 8,
              enterText: 'Show (s)',
              textColor: Color.fromRGBO(0, 124, 168, 1),
              containerColor: Color.fromRGBO(0, 124, 168, 1),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8),
              child: Text(
                'New',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(0, 124, 168, 1),
                ),
              ),
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
                      MagazineNewContainer(
                        imageUrl_Shows: 'assets/images/Add_1.png',
                        videoTitle: 'videoTitle',
                        onPressed: () {},
                      ),
                      MagazineNewContainer(
                        imageUrl_Shows: 'assets/images/Add_1.png',
                        videoTitle: 'videoTitle',
                        onPressed: () {},
                      ),
                      MagazineNewContainer(
                        imageUrl_Shows: 'assets/images/Add_1.png',
                        videoTitle: 'videoTitle',
                        onPressed: () {},
                      ),
                      MagazineNewContainer(
                        imageUrl_Shows: 'assets/images/Add_1.png',
                        videoTitle: 'videoTitle',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 3,
              width: double.infinity,
              color: const Color.fromRGBO(0, 124, 168, 1),
            ),
            Container(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8),
              child: Text(
                'Brands - In Focus',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(0, 124, 168, 1),
                ),
              ),
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
                      MagazineNewContainer(
                        imageUrl_Shows: 'assets/images/Add_1.png',
                        videoTitle: 'videoTitle',
                        onPressed: () {},
                      ),
                      MagazineNewContainer(
                        imageUrl_Shows: 'assets/images/Add_1.png',
                        videoTitle: 'videoTitle',
                        onPressed: () {},
                      ),
                      MagazineNewContainer(
                        imageUrl_Shows: 'assets/images/Add_1.png',
                        videoTitle: 'videoTitle',
                        onPressed: () {},
                      ),
                      MagazineNewContainer(
                        imageUrl_Shows: 'assets/images/Add_1.png',
                        videoTitle: 'videoTitle',
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
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

class MagazineNewContainer extends StatelessWidget {
  final String imageUrl_Shows;
  final String videoTitle;
  final VoidCallback onPressed;

  MagazineNewContainer({
    required this.imageUrl_Shows,
    required this.videoTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 8.0, left: 8.0, top: 12, bottom: 4),
          child: Container(
            width: 150,
            height: 180,
            child: Image.asset(
              imageUrl_Shows,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: 15,
            child: Text(
              videoTitle,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        )
      ],
    );
  }
}
