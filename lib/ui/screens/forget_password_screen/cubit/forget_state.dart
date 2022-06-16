part of 'forget_cubit.dart';

@immutable
abstract class ForgetState {}

class ForgetInitial extends ForgetState {}
class IncrementStepState extends ForgetState {}
class ForgetPasswordLoadingState extends ForgetState {}
class ForgetPasswordSuccessState extends ForgetState {}
class ForgetPasswordNotSuccessState extends ForgetState {
  String error;

  ForgetPasswordNotSuccessState(this.error);
}
class ForgetPasswordErrorState extends ForgetState {}


class ResetPasswordLoadingState extends ForgetState {}
class ResetPasswordSuccessState extends ForgetState {}
class ResetPasswordNotSuccessState extends ForgetState {
  String error;

  ResetPasswordNotSuccessState(this.error);
}
class ResetPasswordErrorState extends ForgetState {}