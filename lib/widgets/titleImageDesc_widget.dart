import 'package:flutter/material.dart';

import 'circle_image_widget.dart';
import 'descWidget.dart';
import 'title_widget.dart';

class TitleImageDescWidget extends StatelessWidget {
  final String title;
  final String image;
  final String desc;

  TitleImageDescWidget({this.image, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleWidget(
          title: title
        ),
        SizedBox(
          height: 40,
        ),
        CircleImageWidget(
          image: image,
          colors: [Color(0xff92b1fc), Color(0xff4177fb)],
        ),
        SizedBox(
          height: 25,
        ),
        DescriptionWidget(desc: desc),
      ],
    );
  }
}
