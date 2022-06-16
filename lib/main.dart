import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zhelper/main_layout/main_layout.dart';
import 'package:zhelper/main_layout/screens/home2/home2.dart';
import 'package:zhelper/shared/helper/bloc_observer.dart';
import 'package:zhelper/shared/services/local/cache_helper.dart';
import 'package:zhelper/shared/services/network/dio_helper.dart';
import 'package:zhelper/shared/styles/styles.dart';
import 'package:zhelper/ui/screens/splash_screen/splash_screen.dart';


void main() {
  BlocOverrides.runZoned(
    () async{
      WidgetsFlutterBinding.ensureInitialized();
      await CachedHelper.init();
      DioHelper.init();
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Zhelper',
      theme: ThemeManger.setLightTheme(),
      home:  SplashScreen(),
    );
  }
}
