import 'package:getx_api_demo/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();
  static Future<List<Product>?> fetchProduct() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonstring = response.body;
      return productFromJson(jsonstring);
    } else {
      return null;
    }
  }
}
