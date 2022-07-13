part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class ChangePasswordVisibiltyState extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginNotSuccessState extends LoginState {
  String msg;

  LoginNotSuccessState(this.msg);
}
class LoginSuccessLoginInState extends LoginState {
}
class LoginErrorState extends LoginState {
  String errorMsg;

  LoginErrorState({required this.errorMsg});
}
