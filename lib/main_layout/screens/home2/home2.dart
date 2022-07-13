import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/main_layout/screens/home/components/articles_item_design.dart';
import 'package:zhelper/main_layout/screens/home/components/custom_card.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/shared/helper/mangers/size_config.dart';
import 'package:zhelper/shared/helper/methods.dart';
import 'package:zhelper/ui/screens/login_screen/login_screen.dart';
import 'package:zhelper/ui/screens/register/register.dart';
import 'package:zhelper/ui/widgets/app_text.dart';
import 'package:zhelper/ui/widgets/custom_button.dart';

import '../../../ui/screens/articles_screen/articles_screen.dart';

class Home2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getAllArticles(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: state is GetAllArticlesLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenHeight(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: getProportionateScreenHeight(30)),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                                height: SizeConfigManger.bodyHeight * .25,
                                decoration: BoxDecoration(
                                  color: ColorsManger.lightGrey,
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenHeight(20)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(10)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              getProportionateScreenHeight(20)),
                                      child: Row(
                                        children: [
                                          AppText(
                                            text: "هل تمتلك حساب ؟",
                                            textSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(
                                              width:
                                                  getProportionateScreenHeight(
                                                      15)),
                                          CustomButton(
                                            width:
                                                SizeConfigManger.screenWidth *
                                                    .4,
                                            press: () {
                                              navigateToAndFinish(
                                                  context, LoginScreen());
                                            },
                                            text: "تسجيل الدخول",
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(20)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              getProportionateScreenHeight(20)),
                                      child: Row(
                                        children: [
                                          AppText(
                                            text: "لا تمتلك حســـاب ؟",
                                            textSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(
                                              width:
                                                  getProportionateScreenHeight(
                                                      15)),
                                          CustomButton(
                                            width:
                                                SizeConfigManger.screenWidth *
                                                    .4,
                                            press: () {
                                              navigateToAndFinish(
                                                  context, RegisterScreen());
                                            },
                                            text: "إنشاء حساب",
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                          Container(
                              color: Colors.blue,
                              height: SizeConfigManger.bodyHeight * .25,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          fit: BoxFit.fitHeight,
                                          image: AssetImage(
                                              'assets/images/home.png'),
                                        ),
                                      ),
                                      width: SizeConfigManger.screenWidth * .3,
                                      height: SizeConfigManger.bodyHeight * .28,
                                    ),
                                    Spacer(),
                                    Expanded(
                                      child: Container(
                                        child: AppText(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            maxLines: 5,
                                            text:
                                                'زود معرفتك بالمرض وأقرأ المقالات العلمية عن كل ما يخص مرض الزهايمر'),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: getProportionateScreenHeight(25),
                          ),
                          AppText(
                              text: 'مقالات',
                              color: ColorsManger.darkPrimary,
                              fontWeight: FontWeight.bold),
                          Expanded(
                            child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: GridView(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 5,
                                          crossAxisCount: 2

                                      ),
                                  children: [
                                    ArticlesItemDesign(
                                      press: () {
                                        navigateTo(context, ArticlesScreen(MainCubit.get(context).defList, "تعريف مرض الزهايمر"));
                                      },
                                      image: "assets/images/board2.png",
                                      text: 'تعريف مرض الزهايمر',
                                    ),
                                    ArticlesItemDesign(
                                      press: () {
                                        navigateTo(context, ArticlesScreen(MainCubit.get(context).dietList, "الأغذية والنظام الصحي للتغذية"));
                                      },
                                      image: "assets/images/board2.png",
                                      text: 'الأغذية والنظام الصحي للتغذية',
                                    ),
                                    ArticlesItemDesign(
                                      press: () {
                                        navigateTo(context, ArticlesScreen(MainCubit.get(context).emerList, "الطواريء"));
                                      },
                                      image: "assets/images/board2.png",
                                      text: 'الطواريء',
                                    ),
                                    ArticlesItemDesign(
                                      press: () {
                                        navigateTo(context, ArticlesScreen(MainCubit.get(context).medsList, "العلاجات والادوية"));
                                      },
                                      image: "assets/images/board2.png",
                                      text: 'العلاجات والادوية',
                                    ),
                                    ArticlesItemDesign(
                                      press: () {
                                        navigateTo(context, ArticlesScreen(MainCubit.get(context).sportList, "الانشطة والرياضات"));
                                      },
                                      image: "assets/images/board2.png",
                                      text: 'الانشطة والرياضات',
                                    ),

                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
