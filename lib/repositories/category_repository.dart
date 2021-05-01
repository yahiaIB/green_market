
import 'package:Blwahda/models/category_entity.dart';
import 'package:Blwahda/web_services/endpoints.dart';
import 'package:Blwahda/web_services/http_client.dart';

class CategoryRepository{

  Future<List <CategoryEntity> > fetchCategories({String userId}) async {
   final response = await HttpClient.getInstance().get(EndPoints.categoriesEndpoint);
   List <CategoryEntity> categories = response.data.map<CategoryEntity>((item)=>CategoryEntity().fromJson(item)).toList();
   return categories;
  }

}