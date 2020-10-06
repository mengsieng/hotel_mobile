import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_native_loading/flutter_native_loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/services/http_services.dart';
import 'package:skull/src/widget/raised_button_widget.dart';
import 'package:skull/src/widget/text_field_widget.dart';

class ChangePasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController oldPassword = new TextEditingController();
    TextEditingController newPassword = new TextEditingController();
    HttpServices http = Provider.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'myProfile.changePassword.title',
                style: Theme.of(context).textTheme.headline6,
              ).tr(),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('myProfile.changePassword.old').tr(),
            RoundTextField(
              controller: oldPassword,
            ),
            Text('myProfile.changePassword.new').tr(),
            RoundTextField(
              controller: newPassword,
            ),
            SizedBox(
              height: 10.0,
            ),
            LongRaisedButton(
              onTap: () async {
                try {
                  FlutterNativeLoading.show();
                  final message = await http.changePassword(
                      oldPassword.text, newPassword.text);
                  Fluttertoast.showToast(msg: "$message");
                  FlutterNativeLoading.hide();
                } catch (e) {
                  FlutterNativeLoading.hide();
                  Fluttertoast.showToast(msg: e.toString());
                }
              },
              title: 'myProfile.changePassword.change',
            ),
          ],
        ),
      ),
    );
  }
}
