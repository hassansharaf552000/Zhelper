import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:zhelper/ui/screens/forget_password_screen/cubit/forget_cubit.dart';

import '../../../../shared/helper/mangers/size_config.dart';
import '../../../../shared/helper/methods.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class ForgetPasswordOneScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetCubit, ForgetState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoadingState) {
          showCustomProgressIndicator(context);
        }
        if (state is ForgetPasswordSuccessState) {
          Navigator.pop(context);
          Toast.show("Check Your Email", context,backgroundColor: Colors.green,duration: 3);
          ForgetCubit.get(context).boardController.nextPage(
              duration: const Duration(
                milliseconds: 750,
              ),
              curve: Curves.fastLinearToSlowEaseIn);
        } else if (state is ForgetPasswordNotSuccessState) {
          Navigator.pop(context);
          Toast.show(state.error, context,
              duration: 3, backgroundColor: Colors.red);
        } else if (state is ForgetPasswordErrorState) {
          Navigator.pop(context);
          Toast.show("Error", context,
              duration: 3, backgroundColor: Colors.red);
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
                    height: SizeConfigManger.bodyHeight * 0.35,
                  ),
                  SizedBox(
                    height: SizeConfigManger.bodyHeight * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenHeight(30.0)),
                    child: Column(
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextFormField(
                              controller: ForgetCubit.get(context).emailController,
                              lableText: 'الإيميل',
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'البريد الإلكترونى مطلوب';
                                }
                              },
                              type: TextInputType.emailAddress,
                              prefixIcon: 'assets/icons/User.svg'),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                        ),
                        CustomButton(
                          text: 'ارسال الكود',
                          press: () {
                            if (formKey.currentState!.validate()) {
                              ForgetCubit.get(context)
                                  .sendCode(email: ForgetCubit.get(context).emailController.text);
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
