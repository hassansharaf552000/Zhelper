import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zhelper/models/user_model.dart';
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

  late UserModel userModel;

  void signInUser({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper().postData(
        path: EndPoint.SingIn,
        data: {"email": email, "password": password}).then((value) async {
      if (value.statusCode == 200) {
        if (value.data['Message'] == "Success") {

          await CachedHelper.saveData(key: 'username', value: value.data['user']['userName']);
          await CachedHelper.saveData(key: 'age', value: value.data['user']['age']);
          await CachedHelper.saveData(key: 'email', value: value.data['user']['email']);


          emit(LoginSuccessLoginInState());
        } else {
          emit(LoginNotSuccessState(value.data['Message']));
        }
      }
    }).catchError((error) {
      print(error);
      emit(LoginErrorState(errorMsg: error.toString()));
    });
  }
}
