import 'package:Blwahda/helpers/app_localizations.dart';
import 'package:Blwahda/view_models/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AvatarNameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) => Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(appViewModel.user.image),
            radius: 25.0,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            AppLocalizations.of(context).translate("Hello") +
                ' ${appViewModel.user.name} !',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
