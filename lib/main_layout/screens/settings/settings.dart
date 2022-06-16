import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/shared/helper/mangers/size_config.dart';
import 'package:zhelper/shared/helper/methods.dart';
import 'package:zhelper/ui/screens/login_screen/login_screen.dart';
import 'package:zhelper/ui/widgets/custom_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            navigateToAndFinish(context, LoginScreen());
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: getProportionateScreenHeight(50),
                left: getProportionateScreenHeight(20),
                right: getProportionateScreenHeight(20)),
            child: Column(
              children: [
                Container(),
                Spacer(),
                CustomButton(
                    text: "تسجيل الخروج",
                    press: () {
                      MainCubit.get(context).logOut();
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
