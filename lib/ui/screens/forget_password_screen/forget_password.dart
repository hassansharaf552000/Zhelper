import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:zhelper/shared/helper/icon_broken.dart';
import 'package:zhelper/shared/helper/methods.dart';
import 'package:zhelper/ui/screens/forget_password_screen/cubit/forget_cubit.dart';
import 'package:zhelper/ui/screens/forget_password_screen/pageview/forget_password_one.dart';
import 'package:zhelper/ui/screens/forget_password_screen/pageview/forget_password_two.dart';
import '../../../shared/helper/mangers/colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetCubit(),
      child: BlocConsumer<ForgetCubit, ForgetState>(
        listener: (context, state) {},
        builder: (context, state) {
          ForgetCubit cubit = ForgetCubit.get(context);
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: IconStepper(
                  enableStepTapping: false,
                  enableNextPreviousButtons: false,
                  activeStepBorderColor: ColorsManger.darkPrimary,
                  activeStep: cubit.currentStep,
                  stepReachedAnimationEffect: Curves.fastLinearToSlowEaseIn,
                  activeStepColor: ColorsManger.darkPrimary,
                  direction: Axis.horizontal,
                  icons: [
                    Icon(IconBroken.Folder, color: Colors.white),
                    Icon(IconBroken.Danger, color: Colors.white),
                  ],
                ),
              ),
              body: Container(
                height: double.infinity,
                width: double.infinity,
                child: PageView(
                    controller: cubit.boardController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ForgetPasswordOneScreen(),
                      ForgetPasswordTwoScreen(),
                    ]),
              ));
        },
      ),
    );
  }
}
