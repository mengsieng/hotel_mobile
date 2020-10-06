import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/provider/auth_provider.dart';
import 'package:skull/src/screens/signup/widget/bottom_sheet_widget.dart';
import 'package:skull/src/widget/raised_button_widget.dart';
import 'package:skull/src/widget/text_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../utils/route_name.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of(context, listen: false);
    DateTime dateNow = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            auth.clear();
            Navigator.pushNamed(context, Welcome);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          primary: false,
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
              controller: auth.usernameController,
            ),
            RoundTextField(
              title: 'createAccount.password',
              controller: auth.passwordController,
              obscureText: true,
            ),
            RoundTextField(
              title: 'createAccount.firstName',
              controller: auth.firstNameController,
            ),
            RoundTextField(
              title: 'createAccount.lastName',
              controller: auth.lastNameController,
            ),
            RoundTextField(
              title: 'createAccount.gender',
              controller: auth.genderController,
              icon: Icons.wc,
              readOnly: true,
              onTap: () {
                settingModalBottomSheet(
                  context,
                  onChanged: (value) {
                    auth.setGender(value);
                  },
                );
              },
            ),
            RoundTextField(
              onTap: () async {
                DateTime date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 500),
                  lastDate: DateTime(DateTime.now().year + 500),
                  initialDate: dateNow,
                );
                auth.setDate(date.toString());
              },
              controller: auth.dobController,
              readOnly: true,
              title: 'createAccount.dob',
            ),
            RoundTextField(
              title: 'createAccount.phoneNumber',
              controller: auth.phoneNumberController,
            ),
            LongRaisedButton(
              onTap: () {
                auth.signUp(context);
              },
              title: 'createAccount.title',
            ),
            Spacer(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('createAccount.question').tr(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Login);
                    },
                    child: Text(
                      'createAccount.title',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ).tr(),
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
