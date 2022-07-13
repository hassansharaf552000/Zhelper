import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zhelper/models/user_model.dart';

import '../../../../shared/helper/mangers/constants.dart';
import '../../../../shared/services/local/cache_helper.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit get(BuildContext context) => BlocProvider.of(context);

  void checkUserState(context) {
    Future.delayed(Duration(seconds: 2), () {
      bool onBoarding =
          CachedHelper.getBooleon(key: ConstantsManger.ON_BOARDING) ?? false;
      if (onBoarding) {
        String  username = CachedHelper.getString(key: 'username') ?? ConstantsManger.DEFULT;
        String  email = CachedHelper.getString(key: 'email') ?? ConstantsManger.DEFULT;
        int age  = CachedHelper.getInt(key: 'age') ?? 18;

        UserModel userModel = UserModel(username: username, age: age, email: email);
        if (username != ConstantsManger.DEFULT) {
          emit(SplashMainLayoutState(userModel));
        } else {
          emit(SplashLoginState());
        }
      } else {
        emit(SplashOnBoardingState());
      }
    });
  }
}
