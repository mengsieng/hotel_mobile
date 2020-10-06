import 'package:flutter/material.dart';
import 'package:skull/src/model/room_type_model.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    Key key,
    @required this.roomType,
    this.onTap,
  }) : super(key: key);

  final RoomTypeModel roomType;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 120.0,
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Container(
              width: 130.0,
              height: 120.0,
              padding: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  roomType.images[0].imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: width - 140.0,
              height: 120,
              padding: EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        roomType.type,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        roomType.description,
                        style: Theme.of(context).textTheme.caption,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 100.0,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '\$' + roomType.price.toString(),
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
