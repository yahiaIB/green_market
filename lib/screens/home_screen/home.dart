import 'package:Vio_Telehealth/screens/cart_screen/cart_screen.dart';
import 'package:Vio_Telehealth/screens/products_screen/products_screen.dart';
import 'package:Vio_Telehealth/screens/profile_screen/profile_screen.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/category_view_model.dart';
import 'package:Vio_Telehealth/view_models/item_view_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;
  TabController _tabController;

  final List<ItemViewModel> cartItems =[
    new ItemViewModel({'name':"tomato",'image':"res/assets/images/tomato.png",'price':5.0,'unitValue':1.0,'unitChange':0.25}),
    new ItemViewModel({'name':"banana",'image':"res/assets/images/banana.png",'price':15.0,'unitValue':1.0,'unitChange':0.25}),
    new ItemViewModel({'name':"cucumber",'image':"res/assets/images/cucumber.png",'price':6.0,'unitValue':1.0,'unitChange':0.25}),
  ];

  final List<ItemViewModel> vegetablesItems =[
    new ItemViewModel({'name':"tomato",'image':"res/assets/images/tomato.png",'price':5.0,'unitValue':1.0,'unitChange':0.25}),
    new ItemViewModel({'name':"potato",'image':"res/assets/images/potato.png",'price':8.0,'unitValue':1.0,'unitChange':0.25}),
    new ItemViewModel({'name':"cucumber",'image':"res/assets/images/cucumber.png",'price':6.0,'unitValue':1.0,'unitChange':0.25}),
  ];


  List<ItemViewModel> fruitsItems =[
    new ItemViewModel({'name':"orange",'image':"res/assets/images/orange.png",'price':10.0,'unitValue':1.0,'unitChange':0.25}),
    new ItemViewModel({'name':"banana",'image':"res/assets/images/banana.png",'price':15.0,'unitValue':1.0,'unitChange':0.25}),
  ];
  List<CategoryViewModel> categories;


  @override
  void initState() {
    super.initState();
    categories =[
    new CategoryViewModel({'name':"vegetables",'items':vegetablesItems}),
    new CategoryViewModel({'name':"fruits",'items':fruitsItems}),
    ];
    _tabController = new TabController(vsync: this, length: categories.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> _widgetOptions() => <Widget>[
    Products(categories:  categories),
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
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
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
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                title: Text('Cart'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
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
    );
  }
}
