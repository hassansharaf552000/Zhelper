import 'package:flutter/material.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/shared/helper/mangers/size_config.dart';
import 'package:zhelper/ui/widgets/app_text.dart';

class ArticlesItemDesign extends StatelessWidget {
  dynamic press;
  final String image;

  ArticlesItemDesign({required this.press, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: SizeConfigManger.bodyHeight * .15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: getProportionateScreenWidth(242),
                  height: getProportionateScreenWidth(100),
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
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15.0),
                      vertical: getProportionateScreenWidth(10),
                    ),
                    child: AppText(
                      text: 'text',
                      color: Colors.white,
                      maxLines: 2,
                      textSize: 22,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
