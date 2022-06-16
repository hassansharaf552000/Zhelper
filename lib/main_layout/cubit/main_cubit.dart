import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zhelper/main_layout/screens/home/home.dart';
import 'package:zhelper/main_layout/screens/message_screen/message_screen.dart';
import 'package:zhelper/main_layout/screens/request_help/request_help.dart';
import 'package:zhelper/main_layout/screens/settings/settings.dart';
import 'package:zhelper/models/ArticModel.dart';
import 'package:zhelper/shared/helper/icon_broken.dart';
import 'package:zhelper/shared/helper/mangers/constants.dart';
import 'package:zhelper/shared/helper/mangers/end_point.dart';
import 'package:zhelper/shared/services/local/cache_helper.dart';
import 'package:zhelper/shared/services/network/dio_helper.dart';
import '../screens/add_helper/add_helper.dart';
import 'package:http/http.dart' as http;

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    SettingsScreen(),
    AddHelper(),
    HomeScreen(),
    MessageScreen(),
    RequestHelp(),
  ];

  List<BottomNavigationBarItem> bottomNav = [
    BottomNavigationBarItem(icon: Icon(IconBroken.Setting), label: "الإعدادات"),
    BottomNavigationBarItem(
        icon: Icon(Icons.credit_card_outlined), label: "تقديم مساعدة"),
    BottomNavigationBarItem(icon: Icon(IconBroken.Home), label: "الرئيسية"),
    BottomNavigationBarItem(icon: Icon(IconBroken.Chat), label: "محادثة"),
    BottomNavigationBarItem(
        icon: Icon(IconBroken.Info_Circle), label: "طلب مساعدة"),
  ];

  int currentIndex = 4;

  void changeBottomNav(int index) {
    if (index == 2) {
      getAllArticles();
    }
    this.currentIndex = index;
    emit(ChangeBottomNavState());
  }

  ////////////////////////////////////// RequestHelp/////////////////////////////

  var boardController = PageController();

  var patientNameReq = TextEditingController();
  var disMarhalaReq = TextEditingController();
  var patientAgeReq = TextEditingController();

  var patientFamilyNameReq = TextEditingController();
  var patientFamilyPhoneReq = TextEditingController();
  var patientFamilySsnReq = TextEditingController();
  var patientFamilyLocationReq = TextEditingController();

  var helperEducationReq = TextEditingController();
  var helperExpYearsReq = TextEditingController();
  var helperLocationReq = TextEditingController();
  var helperHoursReq = TextEditingController();
  var helperAgeReq = TextEditingController();

  var formKeyReq1 = GlobalKey<FormState>();
  var formKeyReq2 = GlobalKey<FormState>();
  var formKeyReq3 = GlobalKey<FormState>();

  bool isMaleReq = true;

  void chooseGender(bool value) {
    this.isMaleReq = value;
    emit(ChooseGenderState());
  }


  void requestHelp() {
    emit(ReuestHelperLoading());

    print(helperAgeReq.text);
    DioHelper().postData(path: "requestHelp/addRequestHelp", data: {
      "name": patientFamilyNameReq.text,
      "nameOfPatient": patientNameReq.text,
      "governateOfHelper": helperLocationReq.text,
      "genderOfHelper": isMaleReq ? "male" : "female",
      "ageOfHelper": helperAgeReq.text,
      "worksHours": int.parse(helperHoursReq.text),
      "ssn": patientFamilySsnReq.text,
      "phone": patientFamilyPhoneReq.text,
      "gender": isMaleReq ? "male" : "female",
      "deseaseStage": disMarhalaReq.text,
      "age": int.parse(patientAgeReq.text),
      "governate": patientFamilyLocationReq.text,
      "qualification": helperEducationReq.text,
      "skills": "sadsa",
      "yearsOfExperience": int.parse(helperExpYearsReq.text)
    }).then((value) {
      emit(ReuestHelperSuccess(message: value.data["Message"]));
    }).catchError((error) {
      print(error.toString());
    });
  }

  ///////////////////////////////////AddHelper/////////////////////////
  var boardController2 = PageController();

  var helperName = TextEditingController();
  var helperMail = TextEditingController();
  var helperphone = TextEditingController();
  var helperssn = TextEditingController();
  var helperEducation = TextEditingController();
  var helperExprYears = TextEditingController();
  var helperLocation = TextEditingController();
  var helperSkills = TextEditingController();

  bool isMaleHelper = true;

  void chooseGenderHelper(bool value) {
    this.isMaleHelper = value;
    print(isMaleHelper);
    emit(ChooseGenderHelperState());
  }

  void addHelperToServer() async {
    emit(AddHelperLoading());
    DioHelper().postData(path: EndPoint.AddHelper, data: {
      "name": helperName.text,
      "governate": helperEducation.text,
      "qualification": helperLocation.text,
      "skills": helperSkills.text,
      "yearsOfExperience": 2,
      "email": helperMail.text,
      "ssn": helperssn.text,
      "gender": isMaleHelper ? "male" : "female",
      "phone": helperphone.text
    }).then((value) {
      if (value.statusCode == 200) {
        emit(AddHelperSuccess(message: value.data["Message"]));
      }
    }).catchError((error) {
      emit(AddHelperError(message: 'Error'));
      print(error.toString());
    });
  }

  /////////////////////// Home //////////////////////////////

  List<ArticlesModel> articlesList = [];

  void getAllArticles() async {
    emit(GetAllArticlesLoading());
    DioHelper().getData(path: EndPoint.Articals).then((value) {
      articlesList.add(ArticlesModel.fromJson(value.data));
      articlesList.forEach((element) {
        print(element.message);
      });

      emit(GetAllArticlesSuccess());
    }).catchError((error) {
      emit(GetAllArticlesError(message: error.toString()));
    });
  }

  void logOut() async {
    CachedHelper.saveData(
            key: ConstantsManger.TOKEN, value: ConstantsManger.DEFULT)
        .then((value) {
      emit(LogoutSuccess());
    });
  }
}
