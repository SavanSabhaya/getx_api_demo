import 'package:get/state_manager.dart';
import 'package:getx_api_demo/services/remote_service.dart';

import '../models/product.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isloding = true.obs;
  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isloding(true);
      var products = await RemoteService.fetchProduct();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isloding(false);
    }
  }
}
