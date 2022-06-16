import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zhelper/shared/helper/mangers/end_point.dart';
import 'package:zhelper/shared/services/network/dio_helper.dart';

part 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetInitial());

  var boardController = PageController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var conPassController = TextEditingController();
  var CodeController = TextEditingController();

  static ForgetCubit get(context) => BlocProvider.of(context);

  int currentStep = 0;

  void incrementStep() {
    if (currentStep < 2) {
      currentStep++;
    }
    emit(IncrementStepState());
  }

  void sendCode({required String email}) {
    emit(ForgetPasswordLoadingState());
    DioHelper().postData(
        path: EndPoint.ForgetPassword, data: {"email": email}).then((value) {
      if (value.statusCode == 200) {
        if (value.data["message"] == "Check Your Email") {
          emit(ForgetPasswordSuccessState());
        } else {
          emit(ForgetPasswordNotSuccessState(value.data["message"]));
        }
      }
    }).catchError((error) {
      emit(ForgetPasswordErrorState());
    });
  }

  void resetPassword({required String code}) {

    emit(ResetPasswordLoadingState());
    DioHelper().postData(path: EndPoint.RestPassword, data: {
      "email": emailController.text,
      "newPass": passController.text,
      "cnewPass": conPassController.text,
      "code":code
    }).then((value) {
      if (value.statusCode == 200) {
         if (value.data["message"] == "reset done") {
          emit(ResetPasswordSuccessState());
        } else {
          emit(ResetPasswordNotSuccessState(value.data["message"]));
        }
      }
    }).catchError((error) {
      emit(ResetPasswordErrorState());
      print(error.toString());
    });
  }
}
