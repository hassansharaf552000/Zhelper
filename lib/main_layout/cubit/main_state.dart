part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}
class ChangeBottomNavState extends MainState {}
class ChooseGenderState extends MainState {}
class ChooseGenderHelperState extends MainState {}
class PageViewState extends MainState {}

class ReuestHelperLoading extends MainState {}
class ReuestHelperSuccess extends MainState {
  String message;
  ReuestHelperSuccess({required this.message});
}

class ReuestHelperError extends MainState {
  String message;
  ReuestHelperError({required this.message});
}


class AddHelperLoading extends MainState {}
class AddHelperSuccess extends MainState {
  String message;
  AddHelperSuccess({required this.message});
}
class AddHelperError extends MainState {
  String message;
  AddHelperError({required this.message});
}

class GetAllArticlesLoading extends MainState {}
class GetAllArticlesSuccess extends MainState {}
class GetAllArticlesError extends MainState {
  String message;
  GetAllArticlesError({required this.message});
}


class LogoutSuccess extends MainState {}







