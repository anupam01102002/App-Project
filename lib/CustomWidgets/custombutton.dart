import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final Color fillColor;
  final Color textColor;
  final Color borderColor;
  final double width;

  const CustomButton({
    required this.buttonName,
    required this.onPressed,
    required this.fillColor,
    required this.textColor,
    required this.borderColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: fillColor, // button's fill color
          onPrimary: textColor, // button's text color
          elevation: 2, // button's elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // border radius
          ),
          side: BorderSide(
            color: borderColor,
          ), // button's border color
        ),
        onPressed: onPressed,
        child: Text(buttonName),
      ),
    );
  }
}
