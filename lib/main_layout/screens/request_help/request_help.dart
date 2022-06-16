import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:zhelper/main_layout/cubit/main_cubit.dart';
import 'package:zhelper/main_layout/screens/add_helper/pageview_screens/done_screen.dart';
import 'package:zhelper/main_layout/screens/request_help/pageview_screens/req_one.dart';
import 'package:zhelper/main_layout/screens/request_help/pageview_screens/req_three.dart';
import 'package:zhelper/main_layout/screens/request_help/pageview_screens/req_two.dart';
import 'package:zhelper/shared/helper/mangers/size_config.dart';
import 'package:zhelper/ui/widgets/app_text.dart';
import 'package:zhelper/ui/widgets/custom_button.dart';

import '../../../shared/helper/mangers/colors.dart';

class RequestHelp extends StatelessWidget {
  const RequestHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  text: "طلب مساعدة",
                  color: ColorsManger.darkPrimary,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: SizeConfigManger.bodyHeight * .65,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: PageView(
                        controller: MainCubit.get(context).boardController2,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          RequestHelpOne(),
                          RequestHelpTwo(),
                          RequestHelpThree(),
                          DoneScreen('assets/images/done1.png'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    CustomButton(
                        text: "المتابعة",
                        press: () {

                          if (MainCubit.get(context).boardController2.page == 2.0)
                          {
                            int age = int.parse(MainCubit.get(context).helperAgeReq.text);
                            if(age >= 18){
                              MainCubit.get(context).requestHelp();
                            }else
                              {
                                Toast.show("Age must be more than 18 years", context,backgroundColor: Colors.red,duration: 3);
                              }

                          }
                          else if(MainCubit.get(context).boardController2.page == 0.0){
                            
                            int age = int.parse(MainCubit.get(context).patientAgeReq.text);
                            if(age <18){
                              Toast.show("العمر يجب ان يكون اكبر من 18 سنة", context,backgroundColor: Colors.red,duration: 3);
                            }else{
                              MainCubit.get(context).boardController2.nextPage(
                                  duration: const Duration(
                                    milliseconds: 750,
                                  ),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            }

                          }
                          else {
                            if(MainCubit.get(context).boardController2.page == 1.0){
                              if(MainCubit.get(context).patientFamilyPhoneReq.text.length !=11){
                                Toast.show("Phone Must be 11 number", context , duration: 3,backgroundColor: Colors.red);
                              }
                              else if(MainCubit.get(context).patientFamilySsnReq.text.length !=14){
                                Toast.show("SSN Must be 14 number", context , duration: 3,backgroundColor: Colors.red);
                              }
                              else{
                                MainCubit.get(context).boardController2.nextPage(
                                    duration: const Duration(
                                      milliseconds: 750,
                                    ),
                                    curve: Curves.fastLinearToSlowEaseIn);

                              }
                            }
                            }
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
