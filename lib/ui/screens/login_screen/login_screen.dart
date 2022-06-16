import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/main_layout/main_layout.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/shared/helper/mangers/size_config.dart';
import 'package:zhelper/shared/helper/methods.dart';
import 'package:zhelper/ui/screens/forget_password_screen/forget_password.dart';
import 'package:zhelper/ui/screens/login_screen/cubit/login_cubit.dart';
import 'package:zhelper/ui/screens/register/register.dart';
import 'package:zhelper/ui/widgets/app_text.dart';
import 'package:zhelper/ui/widgets/custom_button.dart';
import 'package:zhelper/ui/widgets/custom_text_form_field.dart';
import 'components/background.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState)
            showCustomProgressIndicator(context);
          else if (state is LoginSuccessLoginInState) {
            Toast.show("Welcome", context,backgroundColor: Colors.green,duration: 3);
            Navigator.pop(context);
            navigateToAndFinish(context, MainLayout());
          }
          else if (state is LoginNotSuccessState) {
            Navigator.pop(context);
            Toast.show("${state.msg}", context,backgroundColor: Colors.red,duration: 3);
          }
          else if (state is LoginErrorState) {
            Navigator.pop(context);
            Toast.show("Error", context,backgroundColor: Colors.red,duration: 3);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Form(
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
                                  controller: emailController,
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
                              height: SizeConfigManger.bodyHeight * 0.03,
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: CustomTextFormField(
                                controller: passwordController,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'كلمة المرور مطلوبة';
                                  }
                                },
                                type: TextInputType.visiblePassword,
                                lableText: 'كلمة السر',
                                isPassword: cubit.isPassword,
                                prefixIcon: 'assets/icons/Lock.svg',
                                onSuffixPressed: () {
                                  cubit.changePasswordVisibalty();
                                },
                                suffixIcon: cubit.isPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfigManger.bodyHeight * 0.03,
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context, ForgetPasswordScreen());
                              },
                              child: AppText(
                                  text: "نسيت كلمة المرور ؟",
                                  color: ColorsManger.darkPrimary,
                                  textSize: 22,
                                  textDecoration: TextDecoration.underline),
                            ),
                            SizedBox(
                              height: SizeConfigManger.bodyHeight * 0.03,
                            ),
                            CustomButton(
                              text: 'تسجيل الدخول',
                              press: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.signInUser(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                            ),
                            SizedBox(
                              height: SizeConfigManger.bodyHeight * 0.05,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Container(
                                      color: Colors.grey,
                                      height: 1,
                                    ),
                                  ),
                                ),
                                AppText(text: 'أو'),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Container(
                                      color: Colors.grey,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfigManger.bodyHeight * 0.05,
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context, RegisterScreen());
                              },
                              child: Text(
                                "فتح حساب",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManger.darkPrimary,
                                    fontSize: getProportionateScreenWidth(22)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
