import 'package:flutter/material.dart';
import 'package:zhelper/ui/screens/register/components/register.form.dart';

import '../../../../shared/helper/mangers/size_config.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: SizeConfigManger.bodyHeight * 0.35,
            ),
            SizedBox(height: SizeConfigManger.bodyHeight * 0.08),
            RegisterForm(),
            SizedBox(height: SizeConfigManger.bodyHeight * 0.08),
          ],
        ),
      ),
    );
  }
}
