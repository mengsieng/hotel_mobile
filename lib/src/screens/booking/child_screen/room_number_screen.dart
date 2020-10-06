import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/model/room_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skull/src/provider/booking_provider.dart';

class RoomNumberView extends StatelessWidget {
  final int id;
  RoomNumberView({this.id});
  @override
  Widget build(BuildContext context) {
    final BookingProvider bookingProvider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<RoomModel>>(
        future: bookingProvider.http.getRoomNumber(id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/img/boken_robot.png',
                    height: 150.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'booking.error',
                    style: Theme.of(context).textTheme.headline6,
                  ).tr(),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var data = snapshot.data[index];
              return ListTile(
                onTap: () {
                  if (data.status.status == "BOOKING") {
                    Fluttertoast.showToast(msg: 'booking.notFree'.tr());
                  } else {
                    bookingProvider.room = data;
                    Navigator.pop(context);
                  }
                },
                title: Text(data.number),
                trailing: Text(
                  data.status.status,
                  style: TextStyle(
                      color: data.status.status == "FREE"
                          ? Colors.green
                          : Colors.red),
                ),
                subtitle: Text(data.roomType.description),
              );
            },
          );
        },
      ),
    );
  }
}
