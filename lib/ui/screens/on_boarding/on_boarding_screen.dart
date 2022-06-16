import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/main_layout/screens/home2/home2.dart';
import 'package:zhelper/ui/screens/login_screen/login_screen.dart';
import '../../../shared/helper/mangers/colors.dart';
import '../../../shared/helper/mangers/constants.dart';
import '../../../shared/helper/mangers/size_config.dart';
import '../../../shared/helper/methods.dart';
import '../../../shared/services/local/cache_helper.dart';
import '../../widgets/app_text.dart';
import 'components/body.dart';
import 'cubit/on_boarding_cubit.dart';
import 'cubit/on_boarding_states.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfigManger().init(context);
    return BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Body(),
              appBar: AppBar(
                actions: [
                  TextButton(
                    onPressed: () {
                      submit(context);
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          end: getProportionateScreenHeight(20.0)),
                      child:AppText(text: 'Skip',textSize: 20.0,color: ColorsManger.darkPrimary),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  static void submit(BuildContext context) {
    CachedHelper.saveData(key: ConstantsManger.ON_BOARDING, value: true)
        .then((value) {
      if (value) {
        navigateToAndFinish(context, Home2Screen());
      }
    });
  }
}
