import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:valu_challenge/core/error/server_failures.dart';
import 'package:valu_challenge/core/network/network_info.dart';
import 'package:valu_challenge/features/home/domain/entities/product_entity.dart';
import 'package:valu_challenge/features/home/domain/usecases/get_all_products_use_case.dart';
import 'package:valu_challenge/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'home_cubit_test.mocks.dart';

@GenerateMocks([GetAllProductsUseCase, NetworkInfo])
void main() {
  var getAllProductUseCase = MockGetAllProductsUseCase();
  var networkInfo = MockNetworkInfo();

  HomeCubit cubit = HomeCubit(
      networkInfo: networkInfo, getAllProductsUseCase: getAllProductUseCase);

  group('homeCubit', () {
    test('cubit emits Success state when getAllProducts returns list',
        () async {
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      List<ProductEntity> expectedList = [
        ProductEntity(id: 1),
        ProductEntity(id: 2)
      ];
      when(getAllProductUseCase.call())
          .thenAnswer((_) async => Right(expectedList));
      await cubit.getAllProducts();

      expect(cubit.state, isA<HomeGetProductsSuccessState>());
      expect(cubit.allProducts, expectedList);
    });
    test("cubit emits Error state when getAllProducts fail", () async {
      String errorMessage = "Fail Test case";
      when(getAllProductUseCase.call())
          .thenAnswer((_) async => Left(ServerFailures(errorMessage)));
      await cubit.getAllProducts();
      expect(cubit.state, isA<HomeGetProductsErrorState>());
    });
  });
}
