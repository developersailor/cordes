import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double radius;
  final double height;
  final double width;
  final Widget buttonIcon;
  final VoidCallback onPressed;
  //Color.fromRGBO(98, 0, 238, 1)
  const LoginButton(
      {required this.buttonText,
      this.buttonColor,
      this.textColor,
      this.radius: 16,
      this.height: 40,
      this.width: 200,
      required this.buttonIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SizedBox(
          width: width,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(buttonColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ))),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.all(12.0)),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buttonIcon,
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
                Opacity(opacity: 0, child: buttonIcon)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
