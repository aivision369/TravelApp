import 'package:flutter/material.dart';

import '../../ImageCon.dart';
import '../../colors.dart';
import '../../constants.dart';

class ActionBarHome extends StatelessWidget {
  const ActionBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: kColorScreenBg,
          child: ClipOval(
              child: Image.asset(
                imgProfile,
            color: kColorButtonBg,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          )),
        ),
        Spacer(),
        Text(
          "AiVision",
          style: kHeadingTitle,
        ),
        Spacer(),
        Container(
          child: PhysicalShape(
            color: Colors.white,
            shadowColor: kColorNotificationDropShadow,
            elevation: 14,
            clipper: ShapeBorderClipper(shape: CircleBorder()),
            child: Container(
              height: 40,
              width: 40,
              child: IconButton(
                icon: Image.asset(imgNotificatin), onPressed: () {  },
              ),
            ),
          ),
        )
      ],
    );
  }
}
