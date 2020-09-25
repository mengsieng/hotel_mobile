import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skull/src/widget/raised_button_widget.dart';

import '../../utils/route_name.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Spacer(),
              Center(
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: Image.asset(
                    'assets/img/building.png',
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: Text(
                  'welcome.title',
                  style: Theme.of(context).textTheme.headline6,
                ).tr(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                  child: Text(
                    'welcome.caption',
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ).tr(),
                ),
              ),
              Spacer(),
              LongRaisedButton(
                title: 'welcome.login',
                onTap: () => Navigator.pushNamed(context, Login),
              ),
              LongRaisedButton(
                title: 'welcome.create',
                backgroundColors: Colors.white,
                textColor: Colors.black,
                onTap: () => Navigator.pushNamed(context, SignUp),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
