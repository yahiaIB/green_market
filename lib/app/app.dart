import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './provider_setup.dart';
import '../theme/custom_colors.dart';
import '../config/config.dart';
import '../config/constants.dart';
import '../view_models/app_lang.dart';
import '../view_models/app_theme.dart';
import '../helpers/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../theme/size_config.dart';
import 'routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: MultiProvider(
        providers: providers,
        child: Application(),
      ),
    );
  }
}

class Application extends StatefulWidget {
  Application({Key key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: CustomColors.primaryColorDark,
      statusBarColor: Colors.black12,
    ));
    Configuration.setEnvironment(Environment.PROD);
//    AppLanguage langModel = Provider.of<AppLanguage>(context, listen: false)..fetchLocale();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppLanguage, AppTheme>(
        builder: (context, langModel, themeModel, widget) {
      return MaterialApp(
          title: Constants.appTitle,
          debugShowCheckedModeBanner: false,
          theme: themeModel.appTheme,
          darkTheme: themeModel.appTheme,
          initialRoute: Routes.initRoute,
          onGenerateRoute: Routes.generateRoute,
          locale: langModel.appLocal,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('ar', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ]);
    });
  }
}
