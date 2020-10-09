import 'package:Vio_Telehealth/models/cart.dart';
import 'package:Vio_Telehealth/screens/products_screen/widgets/product_item_widget.dart';
import 'package:Vio_Telehealth/screens/products_screen/widgets/unit_button_widget.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/category_view_model.dart';
import 'package:Vio_Telehealth/view_models/item_view_model.dart';
import 'package:Vio_Telehealth/widgets/screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

List<Tab> Tabs(List<String> l) {
  List<Tab> list;
  for (String c in l) {
    list.add(new Tab(text: c));
  }
  return list;
}

class Products extends StatefulWidget {
  final List<CategoryViewModel> categories;
  Products({@required this.categories});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(vsync: this, length: widget.categories.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:ScreenAppBar(title: "Home",icon: Icons.home,isIconButton: false,),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultTabController(
                length: widget.categories.length,
                child: Container(
                  height: 50,
                  child: new TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: CustomColors.unselectedItemColor,
                    labelColor: CustomColors.mainColor,
                    labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    indicatorColor: CustomColors.mainColor,
                    tabs: List<Widget>.generate(widget.categories.length,
                        (int index) {
                      print(widget.categories[index]);
                      CategoryViewModel category = widget.categories[index];
                      return new Tab(
                        text: category.name,
                      );
                    }),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: List<Widget>.generate(widget.categories.length,
                      (int index) {
                    return StaggeredGridView.count(
                        crossAxisCount: 2,
                        padding: EdgeInsets.all(15),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                        staggeredTiles: widget.categories[index].items
                            .map<StaggeredTile>((_) => StaggeredTile.fit(1))
                            .toList(),
                        children: List<Widget>.generate(
                          widget.categories[index].items.length, (int i) {
                          ItemViewModel item = widget.categories[index].items[i];
                          return ProductItem(item: item);
                        })
                    );
                  }),
                ),
              ),
            ],
          )),
    );
  }
}

