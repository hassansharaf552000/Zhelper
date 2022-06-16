
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class SetErrors extends RegisterState {}
class RemoveErrors extends RegisterState {}


class RegisterLoadingState extends RegisterState {}
class RegisterSuccessCreateState extends RegisterState {}
class RegisterSuccessNotCreatedCreateState extends RegisterState {
  String msg;

  RegisterSuccessNotCreatedCreateState(this.msg);
}
class RegisterFailuerState extends RegisterState {
  String errorMsg;
  RegisterFailuerState(this.errorMsg);
}
