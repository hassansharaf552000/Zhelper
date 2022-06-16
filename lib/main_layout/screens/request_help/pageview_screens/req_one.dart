import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/ui/widgets/app_text.dart';
import 'package:zhelper/ui/widgets/custom_text_form_field.dart';
import '../../../../shared/helper/mangers/size_config.dart';
import '../../../../ui/widgets/custom_choose_gender.dart';

class RequestHelpOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return Form(

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
                      text: 'بيانات المريض',
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
                  controller: cubit.patientNameReq,
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
                  controller: cubit.disMarhalaReq,
                  hintText: "مرحلة المرض",
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "يجب إدخال مرحلة المرض";
                    }
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CustomTextFormField(
                  controller: cubit.patientAgeReq,
                  hintText: "العمر",
                  type: TextInputType.number,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "يجب إدخال العمر";
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
                      groupValue: cubit.isMaleReq,
                      text: 'ذكر',
                      onChanged: (value) {
                        cubit.chooseGender(value!);
                      },
                    ),
                    SizedBox(
                      width: getProportionateScreenHeight(20.0),
                    ),
                    CustomRadioListTileNumber<bool>(
                      value: false,
                      groupValue: cubit.isMaleReq,
                      text: 'إنثي',
                      onChanged: (value) {
                        cubit.chooseGender(value!);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
