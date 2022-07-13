import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/shared/helper/mangers/size_config.dart';
import 'package:zhelper/shared/helper/methods.dart';
import 'package:zhelper/ui/screens/login_screen/login_screen.dart';
import 'package:zhelper/ui/widgets/custom_button.dart';

import '../../../shared/helper/mangers/colors.dart';
import '../../../shared/helper/mangers/constants.dart';
import '../../../shared/services/local/cache_helper.dart';

class SettingsScreen extends StatelessWidget {

  String ? username;
  String ? email;
  int ? age;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            navigateToAndFinish(context, LoginScreen());
          }
        },
        builder: (context, state) {
          username =
              CachedHelper.getString(key: 'username') ?? ConstantsManger.DEFULT;
          email =
              CachedHelper.getString(key: 'email') ?? ConstantsManger.DEFULT;
          age = CachedHelper.getInt(key: 'age') ?? 18;


          return Padding(
            padding: EdgeInsets.only(
                bottom: getProportionateScreenHeight(50),
                left: getProportionateScreenHeight(20),
                right: getProportionateScreenHeight(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(100),
                  ),
                  Center(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 72,
                              backgroundColor:
                              ColorsManger.lightPrimary,
                            ),
                            CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                  'assets/images/logo.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  TextFormField(
                    enabled: false,
                    initialValue:username,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 20,color: Colors.black),
                      ),
                      label: Text("Username"),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  TextFormField(
                    enabled: false,
                    initialValue:email,
                    keyboardType: TextInputType.text,

                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 20,color: Colors.black),
                      ),
                      label: Text("Email"),

                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  TextFormField(
                    enabled: false,
                    initialValue:"$age",
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 20,color: Colors.black),
                      ),
                      label: Text("Age"),
                    ),
                  ),
                  SizedBox(height: 100,),
                  CustomButton(
                      text: "تسجيل الخروج",
                      press: () {
                        MainCubit.get(context).logOut();
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
