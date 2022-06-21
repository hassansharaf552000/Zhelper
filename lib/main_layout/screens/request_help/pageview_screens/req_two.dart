import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/ui/widgets/custom_text_form_field.dart';
import '../../../../shared/helper/icon_broken.dart';
import '../../../../shared/helper/mangers/colors.dart';
import '../../../../shared/helper/mangers/size_config.dart';
import '../../../../ui/widgets/app_text.dart';
import '../../../../ui/widgets/custom_button.dart';
import '../../../../ui/widgets/custom_choose_gender.dart';

class RequestHelpTwo extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          MainCubit.get(context).boardController2.previousPage(
                              duration: const Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        icon: Icon(IconBroken.Arrow___Right)),
                    SizedBox(
                      width: getProportionateScreenHeight(8),
                    ),
                    Image.asset('assets/images/user.png'),
                    SizedBox(
                      width: getProportionateScreenHeight(8),
                    ),
                    AppText(
                      text: 'بيانات اهل المريض',
                      color: ColorsManger.darkPrimary,
                      textSize: 24,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                CustomTextFormField(
                  controller: cubit.patientFamilyNameReq,
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
                  controller: cubit.patientFamilyPhoneReq,
                  hintText: "رقم الهاتف",
                  type: TextInputType.phone,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "يجب إدخال الهاتف";
                    }
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CustomTextFormField(
                  controller: cubit.patientFamilySsnReq,
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
                  controller: cubit.patientFamilyLocationReq,
                  hintText: "المحافظة",
                  type: TextInputType.streetAddress,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "يجب إدخال المحافظة";
                    }
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                CustomButton(
                    text: "التالي",
                    press: () {
                      if (formKey.currentState!.validate()) {
                        if (MainCubit.get(context)
                                .patientFamilyPhoneReq
                                .text
                                .length !=
                            11) {
                          Toast.show("Phone Must be 11 number", context,
                              duration: 3, backgroundColor: Colors.red);
                        } else if (MainCubit.get(context)
                                .patientFamilySsnReq
                                .text
                                .length !=
                            14) {
                          Toast.show("SSN Must be 14 number", context,
                              duration: 3, backgroundColor: Colors.red);
                        } else if (MainCubit.get(context)
                                .patientFamilyNameReq
                                .text
                                .length <
                            4) {
                          Toast.show("يجب ادخال 4 اخرف او اكثر", context,
                              duration: 3, backgroundColor: Colors.red);
                        } else {
                          MainCubit.get(context).boardController2.nextPage(
                              duration: const Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      }
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
