import 'package:flutter/material.dart';
import '../../../../shared/helper/mangers/colors.dart';
import '../../../../shared/helper/mangers/size_config.dart';
import '../../../widgets/app_text.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Center(
          child: Padding(
            padding:  EdgeInsets.only(bottom: getProportionateScreenHeight(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: 'Z',
                  color: Colors.black,
                  textSize: 26,

                ),
                AppText(
                  text: 'HELPER',
                  color: ColorsManger.darkPrimary,
                  textSize: 26,

                ),

              ],
            ),
          ),
        ),
        Spacer(flex: 2),
        Image.asset(image!,height: getProportionateScreenHeight(265),
            width: getProportionateScreenWidth(235)),
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: AppText(
            text: text!,
            align: TextAlign.center,
            maxLines: 3,
            textSize: 20,
            color: ColorsManger.darkPrimary,
          ),
        ),
      ],
    );
  }
}
