
import '../models/product_model.dart';

abstract class HomeDataSources {
  Future<List<ProductModel>> getAllProducts();
}
