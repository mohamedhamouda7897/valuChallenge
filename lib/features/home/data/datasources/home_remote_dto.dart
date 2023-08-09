import 'package:injectable/injectable.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../models/product_model.dart';
import 'home_data_sources.dart';

@LazySingleton(as: HomeDataSources)
class HomeRemoteDto implements HomeDataSources {
  final ApiService apiService;

  HomeRemoteDto({
    required this.apiService,
  });

  @override
  Future<List<ProductModel>> getAllProducts() async {
    var data = await apiService.get(endPoint: EndPoints.allProducts);
    List<ProductModel> productList = parseCourseData(data);
    return productList;
  }

  List<ProductModel> parseCourseData(List<dynamic> data) {
    List<ProductModel> productsList = [];
    for (var courseMap in data) {
      productsList.add(ProductModel.fromJson(courseMap));
    }
    return productsList;
  }
}
