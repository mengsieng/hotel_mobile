import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/provider/auth_provider.dart';
import 'package:skull/src/provider/home_provider.dart';
import 'package:skull/src/utils/route_name.dart';

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
    AuthProvider authProvider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('myProfile.title').tr(),
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {},
                title: Text(
                  homeProvider.user.firstName +
                      " " +
                      homeProvider.user.lastName,
                ),
                leading: CircleAvatar(
                  radius: 25,
                ),
                subtitle: Text(
                  'myProfile.seeProfile',
                ).tr(),
              ),
              Divider(),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => Navigator.pushNamed(context, Booking,
                          arguments: homeProvider.roomModel),
                      title: Text(
                        'home.bookingRoom',
                      ).tr(),
                      leading: Image.asset(
                        'assets/img/booking.png',
                        width: 30.0,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        'home.orderFood',
                      ).tr(),
                      leading: Image.asset(
                        'assets/img/food.png',
                        width: 30.0,
                      ),
                    ),
                    ListTile(
                      onTap: () => Navigator.pushNamed(
                        context,
                        MyBooking,
                      ),
                      title: Text(
                        'home.myBooking',
                      ).tr(),
                      leading: Image.asset(
                        'assets/img/myBooking.png',
                        width: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ExpansionTile(
                leading: Icon(Icons.settings),
                title: Text('myProfile.setting').tr(),
                children: [
                  ListTile(
                    onTap: () => Navigator.pushNamed(context, ProfileLanguage),
                    title: Text(
                      'myProfile.language.title',
                    ).tr(),
                    leading: Icon(Icons.language),
                  ),
                  ListTile(
                    onTap: () => Navigator.pushNamed(context, ChangePassword),
                    title: Text(
                      'myProfile.changePassword.title',
                    ).tr(),
                    leading: Icon(Icons.vpn_key),
                  ),
                ],
              ),
              ListTile(
                onTap: () => authProvider.logout(context),
                title: Text(
                  'booking.logOut',
                ).tr(),
                leading: Icon(Icons.exit_to_app),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
