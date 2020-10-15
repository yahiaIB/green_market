import 'package:Vio_Telehealth/config/constants.dart';
import 'package:Vio_Telehealth/models/category.dart';
import 'package:Vio_Telehealth/models/item.dart';
import 'package:Vio_Telehealth/view_models/base_model.dart';
import 'package:Vio_Telehealth/view_models/category_view_model.dart';

class ItemViewModel extends BaseViewModel {

  List<Item> _items = Constants.items();
  List<Category> _categoriesNames = Constants.categories();
  List categoriesList = [];

  List<Item> get getItems => _items;
  List<Category> get getCategoriesNames => _categoriesNames;

  void fetchCategoriesList(){
    categoriesList = [];
    _categoriesNames.forEach(
            (category) {
          categoriesList.add({"name": category.name,"items": splitCategories(_items,category.name)},);
        }
    );
  }



  void setAmount({double value,int itemIndex,int categoryIndex}) {
    print(value);
    print(itemIndex);

    categoriesList[categoryIndex]["items"][itemIndex].amount = value;
    notifyListeners();
  }

  void setSelectedAtCart({bool value,int itemIndex,int categoryIndex,int optionIndex}) {
    categoriesList[categoryIndex]["items"][itemIndex].options[optionIndex].isSelectedAtCart = value;

    notifyListeners();
  }

  void setSelectedOptionIndex({int optionIndex,int itemIndex,int categoryIndex}) {
    categoriesList[categoryIndex]["items"][itemIndex].selectedOptionIndex = optionIndex;
    notifyListeners();
  }

  List<Item> splitCategories(List<Item> items, String categoryName){
    List<Item> list=[];
    items.forEach(
            (item) {
          if(item.categoryName == categoryName){
            list.add(item);
          }
        }
    );
    return list;
  }

}