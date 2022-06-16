import 'package:flutter/material.dart';
class Background extends StatelessWidget {

  Widget widget;

  Background(this.widget);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            )),
        widget,
      ],
    );
  }
}
