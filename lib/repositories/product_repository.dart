import 'package:Blwahda/models/product_entity.dart';
import 'package:Blwahda/web_services/endpoints.dart';
import 'package:Blwahda/web_services/http_client.dart';

class ProductRepository{
  Future<List <ProductEntity> > fetchProducts({String userId}) async {
    final response = await HttpClient.getInstance().get(EndPoints.productsEndpoint);
    List <ProductEntity> products = response.data.map<ProductEntity>((product)=>ProductEntity().fromJson(product)).toList();
    return products;
  }
}