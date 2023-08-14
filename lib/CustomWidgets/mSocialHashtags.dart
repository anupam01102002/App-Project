import 'package:flutter/material.dart';

class MSocialHashtags extends StatelessWidget {
  final List<String> hashTags;

  const MSocialHashtags({
    required this.hashTags,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
            0.055,
        width: double.infinity,
        color: Color.fromRGBO(255, 115, 114, 0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Row(
                  children: List.generate(hashTags.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 25,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 115, 114, 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 3.0,
                            horizontal: 5,
                          ),
                          child: Center(
                            child: Text(
                              hashTags[index],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
