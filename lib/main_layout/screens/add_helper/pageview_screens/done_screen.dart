import 'package:flutter/material.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';

import '../../../../ui/widgets/app_text.dart';

class DoneScreen extends StatelessWidget {

  String image;


  DoneScreen(this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(image,height: 200,width: 200,),
          SizedBox(height: 40,),
          AppText(text:"تم إستلام طلبك بنجاح, و سيتم الرد عليك قريبا " , color: ColorsManger.darkPrimary,textSize: 25,maxLines: 2),
        ],
      ),
    );
  }
}
