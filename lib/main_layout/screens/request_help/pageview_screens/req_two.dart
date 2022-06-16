import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/ui/widgets/custom_text_form_field.dart';
import '../../../../shared/helper/mangers/colors.dart';
import '../../../../shared/helper/mangers/size_config.dart';
import '../../../../ui/widgets/app_text.dart';
import '../../../../ui/widgets/custom_choose_gender.dart';

class RequestHelpTwo extends StatelessWidget {
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

              ],
            ),
          ),
        );
      },
    );
  }
}