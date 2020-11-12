import 'package:Vio_Telehealth/models/category_entity.dart';
import 'package:Vio_Telehealth/models/product_entity.dart';
import 'package:Vio_Telehealth/repositories/category_repository.dart';
import 'package:Vio_Telehealth/repositories/product_repository.dart';
import 'package:Vio_Telehealth/view_models/base_model.dart';


class ProductViewModel extends BaseViewModel {
  CategoryRepository categoryRepository  = new CategoryRepository();
  ProductRepository productRepository  = new ProductRepository();

  List<ProductEntity> _products = [];

  List<CategoryEntity> _categories =  [];

  List categoriesList = [];

  List<ProductEntity> get getProducts => _products;
  List<CategoryEntity> get getCategories => _categories;

  Future fetchProductsAndCategories() async{
    try {
      setBusy(true);
      categoriesList = [];
      _categories = await categoryRepository.fetchCategories();
      _products = await productRepository.fetchProducts();
      _categories.forEach(
              (category) {
            categoriesList.add({"name": category.name,"items": splitCategories(_products,category.sId)},);
          }
      );
      setBusy(false);
    } catch (err) {
      setBusy(false);
      throw handelError(err);
    }
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

  List<ProductEntity> splitCategories(List<ProductEntity> products, String categoryId){
    List<ProductEntity> list=[];
    products.forEach(
            (product) {
          if(product.category == categoryId){
            list.add(product);
          }
        }
    );
    return list;
  }

}