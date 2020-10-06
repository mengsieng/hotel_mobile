import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/services/preference_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skull/src/utils/route_name.dart';

class ChooseLanguageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SharePreferenceService sharePreferenceService =
        Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select the language that you like',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                color: Colors.white,
                child: ListTile(
                  onTap: () async {
                    context.locale = Locale('en', 'US');
                    await sharePreferenceService.setLanguage(true);
                    Navigator.popAndPushNamed(context, Welcome);
                  },
                  title: Text('English'),
                  dense: false,
                  trailing: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/english.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                color: Colors.white,
                child: ListTile(
                  onTap: () async {
                    context.locale = Locale('km', 'KH');
                    await sharePreferenceService.setLanguage(false);
                    Navigator.popAndPushNamed(context, Welcome);
                  },
                  dense: false,
                  title: Text('ខ្មែរ'),
                  trailing: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/khmer.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
