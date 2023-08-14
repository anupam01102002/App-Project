import 'package:flutter/material.dart';

class MagazineStoriesContainer extends StatelessWidget {
  final String imageUrl_stories;
  final String StoryTitle;
  final String StoryDetails;
  final double borderRadius;

  MagazineStoriesContainer({
    required this.imageUrl_stories,
    required this.StoryDetails,
    required this.StoryTitle,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 110,
              child: ClipRRect(
                child: Image.asset(
                  imageUrl_stories,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 20,
                  width: 80,
                  color: const Color.fromRGBO(34, 200, 244, 1),
                  child: Center(
                    child: Text(
                      StoryTitle,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  StoryDetails,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Mothering.in',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '3 days Ago | 1220 views',
                  style: TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
