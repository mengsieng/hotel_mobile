import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/provider/home_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skull/src/screens/home/widget/home_button_widget.dart';
import 'package:skull/src/screens/home/widget/home_container_widget.dart';
import 'package:skull/src/screens/home/widget/loading_home_container_widget.dart';
import 'package:skull/src/utils/route_name.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = Provider.of(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'home.welcome'.tr() +
                                  '${homeProvider.user == null ? '' : ' ' + homeProvider.user.firstName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'home.question',
                              style: Theme.of(context).textTheme.caption,
                            ).tr(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // print(homeProvider.user.dOB);
                          Navigator.pushNamed(context, Profile,
                              arguments: homeProvider.user);
                        },
                        child: CircleAvatar(
                          radius: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  height: 170.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'home.services',
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ).tr(),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomeButton(
                            title: 'home.bookingRoom',
                            imagePath: 'assets/img/booking.png',
                          ),
                          HomeButton(
                            title: 'home.orderFood',
                            imagePath: 'assets/img/food.png',
                          ),
                          HomeButton(
                            title: 'home.myBooking',
                            imagePath: 'assets/img/myBooking.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Our Room',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              homeProvider.roomModel.isEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, int index) {
                          return LoadingHomeContainer();
                        },
                        childCount: 4,
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, int index) {
                          return RoomContainer(
                            roomModel: homeProvider.roomModel[index],
                          );
                        },
                        childCount: homeProvider.roomModel.length,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
