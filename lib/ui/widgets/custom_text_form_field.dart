import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/helper/mangers/colors.dart';
import '../../shared/helper/mangers/size_config.dart';


class CustomTextFormField extends StatelessWidget {
  bool isPassword;
  bool isWithBorder;
  TextInputType? type;
  dynamic onChange;
  dynamic validate;
  dynamic onTap;
  dynamic onSaved;
  dynamic onSuffixPressed;
  var controller;
  IconData? suffixIcon;
  String? lableText;
  String? hintText;
  String? prefixIcon;
  Color? prefixIconColor;
  int maxLine;
  bool? isEnable;
  bool withBackground;

  CustomTextFormField(
      {this.isPassword = false,
      this.isWithBorder = true,
      this.type = TextInputType.text,
      this.onChange,
      this.validate,
      this.withBackground = true,
      this.onTap,
      this.suffixIcon,
      this.onSuffixPressed,
      this.onSaved,
      this.controller,
      this.isEnable = true,
      this.lableText,
      this.prefixIconColor,
      this.hintText,
        this.maxLine= 1,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    if (withBackground == true) {
      return Container(
        decoration: BoxDecoration(
            color: ColorsManger.lightGrey,
            borderRadius:
                BorderRadius.circular(getProportionateScreenHeight(20.0))),
        child: TextFormField(
          controller: controller,
          obscureText: isPassword == true ? true : false,
          keyboardType: type,
          textDirection: TextDirection.rtl,
          onChanged: onChange,
          onSaved: onSaved,
          maxLines: maxLine,
          enabled: isEnable,
          validator: validate,
          onTap: onTap,
          decoration: InputDecoration(
            labelText: lableText,
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: IconButton(
              icon: Icon(suffixIcon),
              onPressed: onSuffixPressed,
            ),
            prefixIcon: prefixIcon == null
                ? null
                : Padding(
                    padding: EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      prefixIcon!,
                      height: getProportionateScreenHeight(20.0),
                      width: getProportionateScreenHeight(20.0),
                    ),
                  ),
          ),
        ),
      );
    } else {
      return TextFormField(
        maxLines: maxLine,
        style: TextStyle(color: Colors.white),
        controller: controller,
        obscureText: isPassword == true ? true : false,
        keyboardType: type,
        onChanged: onChange,
        onSaved: onSaved,
        enabled: isEnable,
        validator: validate,
        onTap: onTap,
        decoration: isWithBorder == true
            ? InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorsManger.darkPrimary, width: 2.0)),
                labelText: lableText,
                labelStyle: TextStyle(color: Colors.white),
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: onSuffixPressed,
                ),
                prefixIcon: prefixIcon == null
                    ? null
                    : Padding(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          prefixIcon!,
                          color: ColorsManger.darkPrimary,
                          height: getProportionateScreenHeight(20.0),
                          width: getProportionateScreenHeight(20.0),
                        ),
                      ),
              )
            : InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: onSuffixPressed,
                ),
                prefixIcon: prefixIcon == null
                    ? null
                    : Padding(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          prefixIcon!,
                          color: prefixIconColor??ColorsManger.darkPrimary,
                          height: getProportionateScreenHeight(20.0),
                          width: getProportionateScreenHeight(20.0),
                        ),
                      ),
              ),
      );
    }
  }
}
