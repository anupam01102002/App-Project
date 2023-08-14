import 'package:flutter/material.dart';
import 'package:time_machine/time_machine.dart' as time_machine;

class ChildDetailsContainer extends StatelessWidget {
  final String? name;
  final String? dob;
  final time_machine.Period? months;
  final bool? show;

  ChildDetailsContainer({
    this.name,
    this.dob,
    this.show,
    this.months,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(124, 218, 252, 1),
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsContainer_height(
                    idealHeight: '80.2 - 95.2 cm',
                  ),
                  Transform.translate(
                    offset: const Offset(0, -9),
                    child: Image.asset(
                      'assets/images/baby_vector.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  DetailsContainer_weight(idealWeight: '9.1 - 12.5 KG')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 15,
                  child: Text(
                    name!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  height: 15,
                  child: const Text(
                    ' is ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  height: 15,
                  child: Text(
                    months!.years.toString() +
                        ' years, ' +
                        months!.months.toString() +
                        ' months',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  height: 15,
                  child: const Text(
                    ' old',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 15,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(124, 218, 252, 1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      ((months?.years)! * 12 + (months?.months)!).toString() +
                          ' Months',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsContainer_height extends StatelessWidget {
  final double borderRadius;
  final String idealHeight;

  DetailsContainer_height({
    this.borderRadius = 20.0,
    required this.idealHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 5,
          color: const Color.fromRGBO(124, 218, 252, 1),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ideal Height',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              idealHeight,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class DetailsContainer_weight extends StatelessWidget {
  final double borderRadius;
  final String idealWeight;

  DetailsContainer_weight({
    this.borderRadius = 20.0,
    required this.idealWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 5,
          color: const Color.fromRGBO(124, 218, 252, 1),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ideal Weight',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              idealWeight,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}
