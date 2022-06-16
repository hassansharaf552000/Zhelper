import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';

import '../shared/helper/mangers/colors.dart';
import '../ui/widgets/app_text.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: null,
              elevation: 2,
              title:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: 'Z',
                    color: Colors.black,
                    textSize: 26,

                  ),
                  AppText(
                    text: 'HELPER',
                    color: ColorsManger.darkPrimary,
                    textSize: 26,

                  ),

                ],
              ) ,
              centerTitle: true,
            ),
            body:MainCubit.get(context).screens[MainCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: MainCubit.get(context).currentIndex,
              items: MainCubit.get(context).bottomNav,
              onTap: (index){
                MainCubit.get(context).changeBottomNav(index);
              },
            ),
          );
        },
      ),
    );
  }
}
