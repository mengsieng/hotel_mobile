import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/provider/home_provider.dart';
import 'package:skull/src/utils/route_name.dart';
import 'package:skull/src/widget/raised_button_widget.dart';
import 'package:skull/src/widget/text_field_widget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final HomeProvider homeProvider = Provider.of(context, listen: false);
      homeProvider.getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = Provider.of(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('myProfile.title').tr(),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              homeProvider.preferenceService.removeToken();
              Navigator.popAndPushNamed(context, Welcome);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                ),
              ),
              Text('createAccount.firstName').tr(),
              RoundTextField(
                controller: homeProvider.firstName,
              ),
              Text('createAccount.lastName').tr(),
              RoundTextField(
                controller: homeProvider.lastName,
              ),
              Text('createAccount.password').tr(),
              RoundTextField(
                controller: homeProvider.password,
                icon: Icons.remove_red_eye,
              ),
              Text('createAccount.gender').tr(),
              RoundTextField(
                controller: homeProvider.gender,
                icon: Icons.wc,
              ),
              Text('createAccount.dob').tr(),
              RoundTextField(
                controller: homeProvider.dob,
                icon: Icons.calendar_today,
              ),
              SizedBox(
                height: 10.0,
              ),
              LongRaisedButton(
                onTap: () {},
                title: 'myProfile.update',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
