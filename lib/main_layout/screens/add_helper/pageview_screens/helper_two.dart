import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/shared/helper/methods.dart';
import 'package:zhelper/ui/widgets/app_text.dart';
import 'package:zhelper/ui/widgets/custom_text_form_field.dart';
import '../../../../shared/helper/mangers/size_config.dart';
import '../../../../ui/widgets/custom_choose_gender.dart';

class HelperTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is AddHelperLoading) {
          showCustomProgressIndicator(context);
        } else if (state is AddHelperError) {
          Navigator.pop(context);
          Toast.show(state.message, context,
              duration: 3, backgroundColor: Colors.red);
        }
        else if (state is AddHelperSuccess) {
          Navigator.pop(context);
          Toast.show(state.message, context, duration: 3,);
          if(state.message=="Helper Added"){
            MainCubit.get(context).boardController.nextPage(
                duration: const Duration(
                  milliseconds: 750,
                ),
                curve: Curves.fastLinearToSlowEaseIn);
          }

        }
      },
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return SingleChildScrollView(
          child: Form(
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperEducation,
                    hintText: "المؤهل الدراسي",
                    type: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "يجب إدخال المؤهل الدراسي";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperExprYears,
                    hintText: "سنوات الخبرة",
                    type: TextInputType.number,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "يجب إدخال سنوات الخبرة";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperLocation,
                    hintText: "المحافظة",
                    type: TextInputType.streetAddress,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "يجب إدخال المحافظة";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  CustomTextFormField(
                    controller: cubit.helperSkills,
                    hintText: "المهارات",
                    type: TextInputType.text,
                    maxLine: 3,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "يجب إدخال المهارات";
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
