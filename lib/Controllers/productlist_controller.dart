import 'package:get/get.dart';
import 'package:getx_rest_api/Services/remote_services.dart';
import '../Model/product_model.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    isLoading(true);
    try {
      var product = await RemoteServices.fetchProducts();
      if (product != null) {
        productList.value = product;
      }
    } finally {
      isLoading(false);
    }
  }
}
