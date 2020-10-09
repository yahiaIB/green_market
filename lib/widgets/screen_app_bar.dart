import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class ScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  final IconData icon;
  final bool isIconButton;
  final Function onPress;
  final String title;
  ScreenAppBar({@required this.title,@required this.icon,@required this.isIconButton,this.onPress}) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _ScreenAppBarState createState() => _ScreenAppBarState();
}

class _ScreenAppBarState extends State<ScreenAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: CustomColors.mainColor.withOpacity(0.3),
      leading: widget.isIconButton ?
      IconButton(
        icon: Icon(
          widget.icon,
          color: CustomColors.mainColor,
        ),
        onPressed: widget.onPress,
      )
      :
      Icon(
        widget.icon,
        color: CustomColors.mainColor,
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          color: CustomColors.mainColor,
        ),
      ),
    );
  }
}