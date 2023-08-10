import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:valu_challenge/core/error/failures.dart';
import 'package:valu_challenge/core/error/server_failures.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../models/product_model.dart';
import 'home_data_sources.dart';

@LazySingleton(as: HomeDataSources)
class HomeRemoteDataSource implements HomeDataSources {
  final ApiService apiService;

  HomeRemoteDataSource({
    required this.apiService,
  });

  @override
  Future<Either<Failures, List<ProductModel>>> getAllProducts() async {
    try {
      var data = await apiService.get(endPoint: EndPoints.allProducts);
      List<ProductModel> productList = parseCourseData(data);
      return Right(productList);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  List<ProductModel> parseCourseData(List<dynamic> data) {
    List<ProductModel> productsList = [];
    for (var courseMap in data) {
      productsList.add(ProductModel.fromJson(courseMap));
    }
    return productsList;
  }
}
