import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zhelper/ui/widgets/app_text.dart';

import '../../../../shared/helper/mangers/size_config.dart';

class CustomCardHome extends StatelessWidget {
  String text;

  CustomCardHome({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(20),
        ),
        child: Container(
            height: getProportionateScreenHeight(70),
            width: getProportionateScreenHeight(100),
            padding: EdgeInsets.only(left: 20),
            child: Center(
                child: AppText(
                  align: TextAlign.center,
              textSize: 24,
              text: text,
              maxLines: 3,
              fontWeight: FontWeight.w600,
            ))),
      ),
    );
  }
}
