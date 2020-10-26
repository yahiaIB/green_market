import 'package:Vio_Telehealth/config/constants.dart';
import 'package:Vio_Telehealth/models/cart.dart';
import 'package:Vio_Telehealth/models/item.dart';
import 'package:Vio_Telehealth/models/product_entity.dart';
import 'package:Vio_Telehealth/screens/products_screen/widgets/product_item_widget.dart';
import 'package:Vio_Telehealth/screens/products_screen/widgets/unit_button_widget.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/category_view_model.dart';
import 'package:Vio_Telehealth/view_models/product_view_model.dart';
import 'package:Vio_Telehealth/widgets/screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';



class Products extends StatefulWidget {

  Products();

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> with TickerProviderStateMixin  {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemViewModel>(

      builder: (context,mainVM,child){

        _tabController = new TabController(vsync: this, length: mainVM.categoriesList.length);


        return SafeArea(
          child: Scaffold(
              appBar:ScreenAppBar(title: "Home",icon: Icons.home,isIconButton: false,),
              body:mainVM.busy ? Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(CustomColors.mainColor),
              ),) :
              DefaultTabController(
                length: mainVM.categoriesList.length,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TabBar(
                     // controller: _tabController,
                     isScrollable: true,
                     indicatorSize: TabBarIndicatorSize.label,
                     unselectedLabelColor: CustomColors.unselectedItemColor,
                     labelColor: CustomColors.mainColor,
                     labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                     indicatorColor: CustomColors.mainColor,

                     tabs: List<Widget>.generate(mainVM.categoriesList.length,
                             (int index) {
                           print(mainVM.categoriesList[index]);
                           var category = mainVM.categoriesList[index];
                           return Tab(
                             text: category["name"],
                           );
                         }),
                    ),
                    Expanded(
                      child: TabBarView(
                        // controller: _tabController,
                        children: List<Widget>.generate(mainVM.categoriesList.length,
                                (int index) {
                              var category = mainVM.categoriesList[index];
                              return StaggeredGridView.count(
                                  crossAxisCount: 2,
                                  padding: EdgeInsets.all(15),
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 15,
                                  staggeredTiles: category["items"]
                                      .map<StaggeredTile>((_) => StaggeredTile.fit(1))
                                      .toList(),
                                  children: List<Widget>.generate(
                                      category["items"].length, (int i) {
                                    ProductEntity item = category["items"][i];
                                    print(i);
                                    return ProductItem(item: item,itemIndex: i,categoryIndex: index,);
                                  })
                              );
                            }),
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}

