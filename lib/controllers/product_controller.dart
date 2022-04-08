import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rest_api/models/product.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProductController extends GetxController {
  var productList = [].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProductBrand();
  }

  // fetchProductBrand
  void fetchProductBrand() async {
    List<Product> products = [];
    String response = await rootBundle.loadString('text_note/my_text.txt');
    Stream<String> stringStream = Stream<String>.value(response);
    try {
      isLoading.value = true;
      // var products = await RemoteServices.fetchProducts({'brand': brand});
      // if (products != null) {
      // fetchProductPrice(true, products);
      await for (String line in stringStream) {
        var lines = line.split('\n');
        for (int i = 1; i < lines.length; i++) {
          String line = lines[i].substring(1, lines[i].length - 2);
          List<String> values = line.split(",");
          Product product = Product(
              id: int.parse(values[0]),
              name: values[1].substring(1, values[1].length - 2),
              brand_id: int.parse(values[2]),
              category_id: int.parse(values[3]),
              model_year: int.parse(values[4]),
              list_price: double.parse(values[5]));
          products.add(product);
        }
      }
      productList.value = products;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }

    // fetchProductPrice
    // List<Product>? fetchProductPrice(bool isAcending, List<Product> products) {
    //   if (isAcending) {
    //     products.sort((firstProduct, secondProduct) =>
    //         double.parse(firstProduct.price!)
    //             .compareTo(double.parse(secondProduct.price!)));
    //   } else {
    //     products.sort((firstProduct, secondProduct) =>
    //         double.parse(secondProduct.price!)
    //             .compareTo(double.parse(firstProduct.price!)));
    //   }
    //   return products;
    // }
  }
}
