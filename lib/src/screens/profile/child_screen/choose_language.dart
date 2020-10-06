import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/services/preference_service.dart';
import 'package:skull/src/utils/route_name.dart';

class ProfileLanguageChooseView extends StatefulWidget {
  @override
  _ProfileLanguageChooseViewState createState() =>
      _ProfileLanguageChooseViewState();
}

class _ProfileLanguageChooseViewState extends State<ProfileLanguageChooseView> {
  bool lang;
  @override
  void initState() {
    Future.microtask(() async {
      SharePreferenceService sharePreferenceService =
          Provider.of(context, listen: false);
      lang = await sharePreferenceService.getLanguage();
      setState(() {});
      print(lang);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SharePreferenceService sharePreferenceService =
        Provider.of(context, listen: true);
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
            Card(
              color: !lang ? Colors.grey[200] : Colors.white,
              child: ListTile(
                onTap: () async {
                  context.locale = Locale('en', 'US');
                  await sharePreferenceService.setLanguage(true);
                  Navigator.pushNamedAndRemoveUntil(
                      context, Home, (route) => false);
                  setState(() {});
                },
                title: Text('myProfile.language.english').tr(),
              ),
            ),
            Card(
              color: lang ? Colors.grey[200] : Colors.white,
              child: ListTile(
                onTap: () async {
                  context.locale = Locale('km', 'KH');
                  await sharePreferenceService.setLanguage(false);
                  Navigator.pushNamedAndRemoveUntil(
                      context, Home, (route) => false);
                  setState(() {});
                },
                title: Text('myProfile.language.khmer').tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
