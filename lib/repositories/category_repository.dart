
import 'package:Vio_Telehealth/models/category_entity.dart';
import 'package:Vio_Telehealth/web_services/endpoints.dart';
import 'package:Vio_Telehealth/web_services/http_client.dart';

class CategoryRepository{

  Future<List <CategoryEntity> > fetchCategories({String userId}) async {
   final response = await HttpClient.getInstance().get(EndPoints.categoriesEndpoint);
   List <CategoryEntity> categories = response.data.map<CategoryEntity>((item)=>CategoryEntity().fromJson(item)).toList();
   return categories;
  }

}