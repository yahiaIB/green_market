import 'package:Vio_Telehealth/models/cart.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';
import 'package:Vio_Telehealth/view_models/cart_view_model.dart';
import 'package:Vio_Telehealth/view_models/item_view_model.dart';
import '../screens/authentication_screen/authentication_model.dart';
import '../view_models/app_lang.dart';
import '../view_models/app_theme.dart';
import '../view_models/app_status_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AppLanguage()..fetchLocale()),
  ChangeNotifierProvider(create: (_) => AppTheme()..fetchTheme()),
  ChangeNotifierProvider(create: (_) => AppStatusViewModel()..init()),
  ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
  ChangeNotifierProvider(create: (_) => AppViewModel()),
  ChangeNotifierProvider(create: (_) => ItemViewModel()),
  ChangeNotifierProvider(create: (_) => CartViewModel()),
  // ChangeNotifierProvider(create: (_) => Cart()),
];
