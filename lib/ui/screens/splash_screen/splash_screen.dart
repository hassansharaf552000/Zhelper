import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/shared/helper/methods.dart';
import 'package:zhelper/ui/screens/login_screen/login_screen.dart';
import 'package:zhelper/ui/screens/on_boarding/on_boarding_screen.dart';
import '../../../main_layout/main_layout.dart';
import '../../../main_layout/screens/home2/home2.dart';
import '../../../shared/helper/mangers/size_config.dart';
import '../../widgets/app_text.dart';
import 'cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfigManger().init(context);
    return BlocProvider(
      create: (context) => SplashCubit()..checkUserState(context),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashMainLayoutState) {
            navigateToAndFinish(context, MainLayout());
          } else if (state is SplashLoginState) {
            navigateToAndFinish(context, Home2Screen());
          } else if (state is SplashOnBoardingState) {
            navigateToAndFinish(context, OnBoardingScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfigManger.bodyHeight*.5,),
                Center(
                  child: Container(
                    width: SizeConfigManger.bodyHeight * 0.22,
                    height: SizeConfigManger.bodyHeight * 0.22,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Spacer(),
                Center(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: getProportionateScreenHeight(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: 'Z',
                          color: Colors.black,
                          textSize: 26,

                        ),
                        AppText(
                          text: 'HELPER',
                          color: ColorsManger.darkPrimary,
                          textSize: 26,

                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
