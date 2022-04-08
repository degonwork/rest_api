//
class Product {
  final int id;
  final String name;
  final int brand_id;
  final int category_id;
  final int model_year;
  final double list_price;

  Product(
      {required this.id,
      required this.name,
      required this.brand_id,
      required this.category_id,
      required this.list_price,
      required this.model_year});

  Map<String, dynamic> toMap() {
    return {
      "product_id": id,
      "product_name": name,
      "brand_id": brand_id,
      "category_id": category_id,
      "model year": model_year,
      "list_price": list_price
    };
  }
}
