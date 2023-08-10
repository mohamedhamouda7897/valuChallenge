import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:valu_challenge/core/api/api_service.dart';
import 'package:valu_challenge/core/api/end_points.dart';
import 'package:valu_challenge/core/error/failures.dart';
import 'package:valu_challenge/core/error/server_failures.dart';
import 'package:valu_challenge/features/home/data/datasources/home_remote_data_source.dart';
import 'package:valu_challenge/features/home/data/models/product_model.dart';

import 'home_remote_data_source.mocks.dart';

@GenerateMocks([ApiService])
main() {
  var apiService = MockApiService();
  var homeRemoteDataSource = HomeRemoteDataSource(apiService: apiService);

  group('homeRemoteDataSource', () {
    test('return products if the http call complete successfully ', () async {
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.

      var response = [
        {"id": 1, "image": "url"}
      ];
      when(apiService.get(endPoint: EndPoints.allProducts))
          .thenAnswer((_) async => response);

      expect(await homeRemoteDataSource.getAllProducts(),
          isA<List<ProductModel>>());
    });
    test('return products if the http call complete fail ', () async {
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(apiService.get(endPoint: EndPoints.allProducts))
          .thenThrow((_) async => ServerFailures("message"));

      expect(await homeRemoteDataSource.getAllProducts(),
          isA<Left<Failures, dynamic>>());
    });
  });
}
