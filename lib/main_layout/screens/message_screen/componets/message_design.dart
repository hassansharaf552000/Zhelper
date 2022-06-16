import 'package:flutter/material.dart';

import '../../../../shared/helper/mangers/size_config.dart';
import '../../../../ui/widgets/app_text.dart';

class MessageDesign extends StatelessWidget {
  bool isMyMessage;
  String message;
  String? time;
  String type;

  MessageDesign(
      {required this.isMyMessage,
      required this.message,
      this.time,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(15),
          vertical: getProportionateScreenHeight(3)),
      child: Column(
        crossAxisAlignment:
            isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isMyMessage ? Color(0xFFAED581) : Colors.white,
              borderRadius:
                  BorderRadius.circular(getProportionateScreenHeight(15.0)),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: getProportionateScreenHeight(5),
                  top: getProportionateScreenHeight(1),
                  bottom: getProportionateScreenHeight(5),
                  end: getProportionateScreenHeight(5)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(10.0)),
                    child: AppText(text: '${message}', maxLines: 100),
                  ),
                  AppText(
                    text: '12 AM',
                    color: Colors.grey,
                    textSize: getProportionateScreenHeight(14.0),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
