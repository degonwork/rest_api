// import 'package:http/http.dart' as http;
// import 'package:rest_api/models/product.dart';

// class RemoteServices {
//   static var client = http.Client();
//   static Future<List<Product>?> fetchProducts(Map<String, dynamic> url) async {
//     String urlString =
//         'https://makeup-api.herokuapp.com/api/v1/products.json?${url.keys.first}=${url.values.first.toString()}';

//     var response = await client.get(Uri.parse(urlString));
//     if (response.statusCode == 200) {
//       var jsonString = response.body;
//       return productFromJson(jsonString);
//     } else {
//       return null;
//     }
//   }
// }
