import 'roles.dart';

class Authorizations {

  static final personalDetailsButton = "personal_details_botton";
  static final personalAddressButton = "personal_address_botton";
  static final personalOrdersButton = "personal_orders_botton";

  static final authorizations = {
    personalDetailsButton : [Roles.user],
    personalAddressButton : [Roles.user],
    personalOrdersButton : [Roles.user],
  };

}