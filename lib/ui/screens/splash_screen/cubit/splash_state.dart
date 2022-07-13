part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}
class SplashMainLayoutState extends SplashState {
  UserModel userModel;

  SplashMainLayoutState(this.userModel);
}
class SplashOnBoardingState extends SplashState {}
class SplashLoginState extends SplashState {}
