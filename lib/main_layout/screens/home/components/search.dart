import 'package:flutter/material.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/shared/helper/mangers/size_config.dart';

class CustomSearxhField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      decoration: BoxDecoration(
        color: ColorsManger.lightGrey.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          onChanged: (value) => print(value),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "البحث",
              prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
