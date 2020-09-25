import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skull/src/model/room_type_model.dart';

class RoomContainer extends StatelessWidget {
  const RoomContainer({
    Key key,
    this.roomModel,
  }) : super(key: key);

  final RoomTypeModel roomModel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 30;
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.30,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    roomModel.images[0].imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              _getImage(roomModel.images[1].imageUrl, width),
              _getImage(roomModel.images[2].imageUrl, width),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomModel.type,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    roomModel.description,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '${roomModel.price}\$',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Theme.of(context).primaryColor,
                child: Text(
                  'home.button',
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: Colors.white,
                      ),
                ).tr(),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getImage(String images, double width) {
    return Container(
      width: width * 0.30,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: CachedNetworkImage(
          imageUrl: images,
          fit: BoxFit.fill,
          placeholder: (context, url) => Container(
            padding: EdgeInsets.all(60.0),
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
