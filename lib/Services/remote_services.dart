import 'package:getx_rest_api/Model/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static Future<List<Product>?> fetchProducts() async {
    final response = await http.get(Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }
}
