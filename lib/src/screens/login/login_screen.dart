import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/provider/auth_provider.dart';
import 'package:skull/src/widget/raised_button_widget.dart';
import 'package:skull/src/widget/text_field_widget.dart';

import '../../utils/route_name.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pushNamed(context, Welcome),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
                  child: Text(
                    'login.title',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ).tr(),
                ),
                RoundTextField(
                  title: 'login.username',
                  controller: usernameController,
                ),
                RoundTextField(
                  title: 'login.password',
                  controller: passwordController,
                  obscureText: true,
                ),
                LongRaisedButton(
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      authProvider.login(context,
                          username: usernameController.text,
                          password: passwordController.text);
                    }
                  },
                  title: 'login.title',
                ),
                Spacer(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('login.question').tr(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignUp);
                        },
                        child: Text(
                          'login.title',
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
        ),
      ),
    );
  }
}
