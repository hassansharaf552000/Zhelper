import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/shared/helper/mangers/end_point.dart';
import 'package:zhelper/shared/services/network/dio_helper.dart';
import 'package:zhelper/ui/screens/register/cubit/register_state.dart';
import 'package:http/http.dart' as http;

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void regiterNewUser(
      {required String email,
      required String password,
      required int age,
      required String username}) async {
    emit(RegisterLoadingState());

    DioHelper().postData(path: EndPoint.SignUp, data: {
      "userName": "$username",
      "age": age,
      "email": "$email",
      "password": "$password"
    }).then((value) {
      if (value.statusCode == 200) {
        if(value.data["Message"] == "Added user"){
          emit(RegisterSuccessCreateState());
        }else{
          emit(RegisterSuccessNotCreatedCreateState(value.data["Message"]));
        }
      }
    }).catchError((error) {
      emit(RegisterFailuerState(error.toString()));
    });
  }
}
