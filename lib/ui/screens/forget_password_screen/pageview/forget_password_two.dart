import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:zhelper/shared/helper/methods.dart';
import 'package:zhelper/ui/screens/forget_password_screen/cubit/forget_cubit.dart';
import 'package:zhelper/ui/screens/login_screen/login_screen.dart';

import '../../../../shared/helper/mangers/colors.dart';
import '../../../../shared/helper/mangers/size_config.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class ForgetPasswordTwoScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var pinCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetCubit, ForgetState>(
      listener: (context, state) {

        if(state is ResetPasswordLoadingState){
          showCustomProgressIndicator(context);
        }
         else if(state is ResetPasswordSuccessState){
           Navigator.pop(context);
           Toast.show("reset done", context,duration: 3,backgroundColor: Colors.green);
           navigateToAndFinish(context, LoginScreen());
        }
         else if(state is ResetPasswordNotSuccessState){
          Navigator.pop(context);
          Toast.show("${state.error}", context,duration: 3,backgroundColor: Colors.red);
        }
        else if(state is ResetPasswordErrorState){
          Navigator.pop(context);
          Toast.show("Server Error", context,duration: 3,backgroundColor: Colors.red);
        }

      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    height: SizeConfigManger.bodyHeight * 0.25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenHeight(30.0)),
                    child: Column(
                      children: [
                        PinCodeTextField(
                          controller: pinCode,
                          appContext: context,
                          autoFocus: true,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          length: 6,
                          obscureText: false,
                          animationType: AnimationType.scale,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            borderWidth: 1,
                            activeColor: ColorsManger.darkPrimary,
                            inactiveColor: ColorsManger.darkPrimary,
                            inactiveFillColor: Colors.white,
                            activeFillColor: ColorsManger.lightPrimary,
                            selectedColor: ColorsManger.darkPrimary,
                            selectedFillColor: Colors.white,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.white,
                          enableActiveFill: true,
                          onChanged: (String value) {},
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextFormField(
                            controller: ForgetCubit.get(context).passController,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'كلمة المرور مطلوبة';
                              }
                            },
                            type: TextInputType.visiblePassword,
                            lableText: 'كلمة السر',
                            prefixIcon: 'assets/icons/Lock.svg',
                            isPassword: true,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextFormField(
                            controller: ForgetCubit.get(context).conPassController,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'تأكيد كلمة المرور مطلوبة';
                              }
                            },
                            type: TextInputType.visiblePassword,
                            lableText: 'تأكيد كلمة المرور',
                            prefixIcon: 'assets/icons/Lock.svg',
                            isPassword: true,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                        ),
                        CustomButton(
                          text: 'تاكيد',
                          press: () {
                            if (formKey.currentState!.validate()) {
                              ForgetCubit.get(context).resetPassword(code: pinCode.text);
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
