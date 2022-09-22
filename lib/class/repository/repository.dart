import 'package:shopify/class/model/models.dart';
import 'package:shopify/class/repository/api-calls.dart';

class ShopifyRepository {
  var apiCalls = APICalls();

  Future<String> login(String email, password) async {
    var result = await apiCalls.login("auth/login/$email/$password");
    print(result);
    return result;
  }

  Future<List<Product>> fetchProduct() async {
    var results = await apiCalls.getData("products/");
    print(results);
    List<Product> data = results.map((e) => Product.fromJson(e)).toList();
    print(data[0].category);
    print(data.length);
    return data;
    // print(result);
    // return result;
  }
}
