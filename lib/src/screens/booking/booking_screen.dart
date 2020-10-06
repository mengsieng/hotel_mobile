import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/model/room_model.dart';
import 'package:skull/src/provider/booking_provider.dart';
import 'package:skull/src/provider/home_provider.dart';
import 'package:skull/src/screens/booking/widget/room_card_widget.dart';
import 'package:skull/src/utils/route_name.dart';
import 'package:skull/src/widget/raised_button_widget.dart';
import 'package:skull/src/widget/text_field_widget.dart';

class BookingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dateNow = DateTime.now();
    final HomeProvider homeProvider = Provider.of(context, listen: true);
    final BookingProvider bookingProvider = Provider.of(context, listen: false);
    ScrollController scrollController = ScrollController();
    final _formKey = GlobalKey<FormState>();
    RoomModel room;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          bookingProvider.clear();
          Navigator.pushNamed(context, Home);
        }),
        title: Text('booking.title').tr(),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('createAccount.firstName').tr(),
                    RoundTextField(
                      readOnly: true,
                      controller: bookingProvider.firstNameController,
                    ),
                    Text('createAccount.lastName').tr(),
                    RoundTextField(
                      readOnly: true,
                      controller: bookingProvider.lastNameController,
                    ),
                    Text('createAccount.phoneNumber').tr(),
                    RoundTextField(
                      readOnly: true,
                      controller: bookingProvider.phoneNumberController,
                    ),
                    Text('booking.checkinDate').tr(),
                    RoundTextField(
                      readOnly: true,
                      onTap: () async {
                        DateTime date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(DateTime.now().year - 500),
                          lastDate: DateTime(DateTime.now().year + 500),
                          initialDate: dateNow,
                        );
                        bookingProvider
                            .setDate(date == null ? '' : date.toString());
                      },
                      controller: bookingProvider.checkInController,
                      icon: Icons.calendar_today,
                    ),
                    Text('createAccount.dob').tr(),
                    RoundTextField(
                      readOnly: true,
                      controller: bookingProvider.dobController,
                    ),
                    Text('booking.roomNumber').tr(),
                    RoundTextField(
                      onTap: () {
                        Fluttertoast.showToast(msg: 'booking.please'.tr());
                        bookingProvider.gotoBooking(
                            scrollController, homeProvider.roomModel.length);
                      },
                      readOnly: true,
                      controller: bookingProvider.roomNumberController,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'booking.roomTitle',
                    style: Theme.of(context).textTheme.headline6,
                  ).tr(),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, int index) {
                    return RoomCard(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoomNumber,
                          arguments: homeProvider.roomModel[index].id,
                        );
                      },
                      roomType: homeProvider.roomModel[index],
                    );
                  },
                  childCount: homeProvider.roomModel.length,
                ),
              ),
              SliverToBoxAdapter(
                child: LongRaisedButton(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      bookingProvider.createBooking();
                    } else {
                      scrollController.animateTo(
                        0,
                        curve: Curves.linear,
                        duration: Duration(milliseconds: 500),
                      );
                    }
                  },
                  title: 'booking.bookingNow',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
