import 'package:flutter/material.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/shared/helper/mangers/size_config.dart';
import 'package:zhelper/ui/widgets/app_text.dart';

class ArticlesItemDesign extends StatelessWidget {
  dynamic press;
  final String image;
  final String text;

  ArticlesItemDesign({required this.press, required this.image , required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: getProportionateScreenWidth(40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF343434).withOpacity(0.7),
                      Color(0xFF343434).withOpacity(0.5),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: AppText(
                    text: '${text}',
                    color: Colors.white,
                    maxLines: 2,
                    textSize: 16,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
