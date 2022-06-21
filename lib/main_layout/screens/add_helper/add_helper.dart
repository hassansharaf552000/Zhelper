import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/main_layout/screens/add_helper/pageview_screens/done_screen.dart';
import 'package:zhelper/main_layout/screens/add_helper/pageview_screens/helper_one.dart';
import 'package:zhelper/main_layout/screens/add_helper/pageview_screens/helper_two.dart';
import 'package:zhelper/main_layout/screens/request_help/pageview_screens/req_one.dart';
import 'package:zhelper/main_layout/screens/request_help/pageview_screens/req_two.dart';
import 'package:zhelper/shared/helper/mangers/size_config.dart';
import 'package:zhelper/ui/widgets/app_text.dart';
import 'package:zhelper/ui/widgets/custom_button.dart';

import '../../../shared/helper/mangers/colors.dart';

class AddHelper extends StatefulWidget {
  const AddHelper({Key? key}) : super(key: key);

  @override
  State<AddHelper> createState() => _AddHelperState();
}

class _AddHelperState extends State<AddHelper> {
  String text = "التالي";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is Change3) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  AppText(
                      textSize: 27,
                      text: "تقديم مساعدة",
                      color: ColorsManger.darkPrimary,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: SizeConfigManger.bodyHeight * .8,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: PageView(
                            controller: MainCubit.get(context).boardController,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              HelperOne(),
                              HelperTwo(),
                              DoneScreen('assets/images/done.png'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                       /* CustomButton(
                            text: text,
                            press: () {
                              if (MainCubit.get(context).boardController.page ==
                                  0.0) {
                                MainCubit cubit = MainCubit.get(context);
                                if (cubit.helperOneFormKey.currentState!
                                    .validate()) {
                                  if (cubit.helperName.text.length < 4) {
                                    Toast.show(
                                        "يجب ادخال 4 احرف او اكثر", context,
                                        duration: 3,
                                        backgroundColor: Colors.red);
                                  } else if (cubit.helperphone.text.length !=
                                      11) {
                                    Toast.show("يرجي ادخال 11 رقم ", context,
                                        duration: 3,
                                        backgroundColor: Colors.red);
                                  } else if (cubit.helperssn.text.length !=
                                      14) {
                                    Toast.show("يرجي ادخال 14 رقم ", context,
                                        duration: 3,
                                        backgroundColor: Colors.red);
                                  } else {
                                    MainCubit.get(context)
                                        .boardController
                                        .nextPage(
                                            duration: const Duration(
                                              milliseconds: 750,
                                            ),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn)
                                        .then((value) {
                                      setState(() {
                                        text = "تقديم";
                                      });
                                    });
                                  }
                                }
                              } else {
                                MainCubit.get(context).addHelperToServer();
                              }
                            })*/
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
