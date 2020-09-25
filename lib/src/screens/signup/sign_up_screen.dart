import 'package:flutter/material.dart';
import 'package:skull/src/screens/signup/widget/bottom_sheet_widget.dart';
import 'package:skull/src/widget/raised_button_widget.dart';
import 'package:skull/src/widget/text_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../utils/route_name.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'createAccount.title',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ).tr(),
            ),
            RoundTextField(
              title: 'createAccount.username',
            ),
            RoundTextField(
              title: 'createAccount.password',
            ),
            RoundTextField(
              title: 'createAccount.firstName',
            ),
            RoundTextField(
              title: 'createAccount.lastName',
            ),
            RoundTextField(
              title: 'createAccount.gender',
              icon: Icons.wc,
              readOnly: true,
              onTap: () {
                settingModalBottomSheet(
                  context,
                  onChanged: (value) {
                    print(value);
                  },
                );
              },
            ),
            RoundTextField(
              title: 'createAccount.dob',
            ),
            RoundTextField(
              title: 'createAccount.phoneNumber',
            ),
            LongRaisedButton(
              onTap: () {},
              title: 'createAccount.title',
            ),
            Spacer(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have account ? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Login);
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
