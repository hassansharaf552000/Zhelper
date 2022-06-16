import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zhelper/shared/helper/mangers/constants.dart';
import 'package:zhelper/shared/helper/mangers/end_point.dart';
import 'package:zhelper/shared/services/local/cache_helper.dart';
import 'package:zhelper/shared/services/network/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  bool isPassword = true;

  void changePasswordVisibalty() {
    isPassword = !isPassword;
    emit(ChangePasswordVisibiltyState());
  }

  void signInUser({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper().postData(
        path: EndPoint.SingIn,
        data: {"email": email, "password": password}).then((value)async {
      if (value.statusCode == 200) {
        if (value.data['Message'] == "Success") {
          await CachedHelper.saveData(key: ConstantsManger.TOKEN, value: value.data['token']);
          emit(LoginSuccessLoginInState());
        } else {
          emit(LoginNotSuccessState(value.data['Message'] ));
        }
      }
    }).catchError((error) {
      emit(LoginErrorState(errorMsg: error.toString()));
    });
  }
}
