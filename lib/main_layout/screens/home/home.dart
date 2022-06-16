import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/main_layout/screens/home/components/articles_item_design.dart';
import 'package:zhelper/main_layout/screens/home/components/custom_card.dart';
import 'package:zhelper/shared/helper/mangers/colors.dart';
import 'package:zhelper/shared/helper/mangers/size_config.dart';
import 'package:zhelper/ui/widgets/app_text.dart';

import 'components/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding:
            EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                CustomSearxhField(),
                SizedBox(
                  height: getProportionateScreenHeight(25),
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
                                image: AssetImage('assets/images/home.png'),
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
                Container(
                  width: double.infinity,
                  height: SizeConfigManger.bodyHeight * .15,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            SizedBox(width: getProportionateScreenHeight(20)),
                        separatorBuilder: (context, index) =>
                            ArticlesItemDesign(
                                press: () {},
                                image: "assets/images/board2.png"),
                        itemCount: 5),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCardHome(text: 'أفضل الأطعمة'),
                    CustomCardHome(text: 'ساعد مريضك'),
                  ],
                ),
                Center(child: CustomCardHome(text: 'نصائح')),
              ],
            ),
          ),
        );
      },
    );
  }
}
