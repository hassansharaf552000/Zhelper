import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/shared/helper/icon_broken.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/ui/widgets/app_text.dart';
import 'package:zhelper/ui/widgets/custom_text_form_field.dart';
import '../../../../shared/helper/mangers/size_config.dart';
import '../../../../ui/widgets/custom_button.dart';
import '../../../../ui/widgets/custom_choose_gender.dart';

class HelperOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return SingleChildScrollView(
          child: Form(
            key: cubit.helperOneFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/user.png'),
                      SizedBox(
                        width: getProportionateScreenHeight(8),
                      ),
                      AppText(
                        text: 'بيانات الشخصية',
                        color: ColorsManger.darkPrimary,
                        textSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperName,
                    hintText: "الأسم",
                    type: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "يجب إدخال الإسم";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperMail,
                    hintText: "الإيميل",
                    type: TextInputType.emailAddress,
                    validate: (String? value) {
                      String pattern =
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?)*$";
                      RegExp regex = RegExp(pattern);
                      if (value == null ||
                          value.isEmpty ||
                          !regex.hasMatch(value))
                        return 'Enter a valid email address';
                      else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperssn,
                    hintText: "الرقم القومي",
                    type: TextInputType.number,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "يجب إدخال الرقم القومي";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperphone,
                    hintText: "رقم الهاتف",
                    type: TextInputType.phone,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "يجب إدخال رقم الهاتف";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRadioListTileNumber<bool>(
                        value: true,
                        groupValue: cubit.isMaleHelper,
                        text: 'ذكر',
                        onChanged: (value) {
                          cubit.chooseGenderHelper(value!);
                        },
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(20.0),
                      ),
                      CustomRadioListTileNumber<bool>(
                        value: false,
                        groupValue: cubit.isMaleHelper,
                        text: 'إنثي',
                        onChanged: (value) {
                          cubit.chooseGenderHelper(value!);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  CustomButton(
                      text: "التالي",
                      press: () {
                        MainCubit cubit = MainCubit.get(context);
                        if (cubit.helperOneFormKey.currentState!.validate()) {
                          if (cubit.helperName.text.length < 4) {
                            Toast.show("يجب ادخال 4 احرف او اكثر", context,
                                duration: 3, backgroundColor: Colors.red);
                          } else if (cubit.helperphone.text.length != 11) {
                            Toast.show("يرجي ادخال 11 رقم ", context,
                                duration: 3, backgroundColor: Colors.red);
                          } else if (cubit.helperssn.text.length != 14) {
                            Toast.show("يرجي ادخال 14 رقم ", context,
                                duration: 3, backgroundColor: Colors.red);
                          } else {
                            MainCubit.get(context).boardController.nextPage(
                                duration: const Duration(
                                  milliseconds: 750,
                                ),
                                curve: Curves.fastLinearToSlowEaseIn);
                          }
                        }
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
