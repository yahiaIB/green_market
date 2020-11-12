import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/screens/cart_screen/cart_screen.dart';
import 'package:Vio_Telehealth/screens/products_screen/products_screen.dart';
import 'package:Vio_Telehealth/screens/profile_screen/profile_screen.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions=[
    Products(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: Consumer<CartViewModel>(
        builder: (BuildContext context, CartViewModel cartVM, Widget child) =>  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text(AppLocalizations.of(context).translate("Home")),
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    alignment: Alignment.center,
                      children: [
                        Icon(Icons.shopping_basket,),
                        cartVM.cartItems.isNotEmpty ?
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.green,
                          ),
                        )
                        :Container(),
                      ]),
                  title: Text(AppLocalizations.of(context).translate("Cart")),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text(AppLocalizations.of(context).translate("Profile")),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: CustomColors.mainColor,
              unselectedItemColor: CustomColors.unselectedItemColor,
              selectedIconTheme: IconThemeData(size: 30),
              selectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
