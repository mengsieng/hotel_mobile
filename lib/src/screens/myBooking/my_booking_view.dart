import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:provider/provider.dart';
import 'package:skull/src/model/my_booking_model.dart';
import 'package:skull/src/screens/myBooking/widget/text_row_widget.dart';
import 'package:skull/src/services/http_services.dart';
import 'package:skull/src/utils/route_name.dart';

class MyBookingView extends StatefulWidget {
  @override
  _MyBookingViewState createState() => _MyBookingViewState();
}

class _MyBookingViewState extends State<MyBookingView> {
  PagewiseLoadController<MyBookingModel> _pageController;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Future.microtask(() {
      HttpServices http = Provider.of(context, listen: false);
      _pageController = PagewiseLoadController(
        pageFuture: (i) => http.getMyBooking(offset: i),
        pageSize: 5,
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pushNamed(context, Home),
        ),
        centerTitle: false,
        title: Text('myBooking.title').tr(),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _pageController.reset();
        },
        child: PagewiseListView(
          showRetry: false,
          pageLoadController: _pageController,
          loadingBuilder: (context) {
            return Container(
              height: height,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          noItemsFoundBuilder: (context) {
            return Container(
              padding: EdgeInsets.only(top: height * 0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, Booking),
                    child: Image.asset(
                      'assets/img/boken_robot.png',
                      height: 150.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'myBooking.error',
                    style: Theme.of(context).textTheme.headline6,
                  ).tr(),
                  Text(
                    'myBooking.continue',
                    style: Theme.of(context).textTheme.caption,
                  ).tr(),
                ],
              ),
            );
          },
          itemBuilder: (context, MyBookingModel data, index) {
            return Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 90.0,
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                          color: getColor(data.status.status),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          )),
                      child: Center(
                        child: Text(
                          data.status.status,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextRow(
                              title: 'myBooking.bookingNumber',
                              contant: data.id.toString(),
                            ),
                            TextRow(
                              title: 'myBooking.roomType',
                              contant: data.room.roomType.type,
                            ),
                            TextRow(
                              title: 'myBooking.roomNumber',
                              contant: data.room.number,
                            ),
                            TextRow(
                              title: 'myBooking.checkInDate',
                              contant: data.checkinDate.split('T')[0],
                            ),
                            TextRow(
                              title: 'myBooking.checkOutDate',
                              contant: '',
                            ),
                            TextRow(
                              title: 'myBooking.total',
                              contant: '\$ ${data.room.roomType.price}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      // body: FutureBuilder<List<MyBookingModel>>(
      //   future: http.getMyBooking(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {

      //     }
      //     if (snapshot.data.isEmpty) {

      //     }
      //   },
      // ),
    );
  }

  Color getColor(String status) {
    if (status == "BOOKING") {
      return Color(0XFFF5F05D);
    } else if (status == "IN") {
      return Color(0XFF5DF592);
    } else {
      return Color(0XFFF55D74);
    }
  }
}
