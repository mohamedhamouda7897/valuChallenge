import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_all_products_use_case.dart';
import 'package:injectable/injectable.dart';
part 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeStates> {
  final NetworkInfo networkInfo;
  final GetAllProductsUseCase getAllProductsUseCase;

  HomeCubit({
    required this.networkInfo,
    required this.getAllProductsUseCase,
  }) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<ProductEntity> allProducts = [];

  void listenToNetworkConnection() {
    networkInfo.isConnected.listen((isConnected) {
      emit(isConnected ? HomeConnectedState() : HomeNotConnectedState());
    });
  }

  Future<void> getAllProducts() async {
    var result = await getAllProductsUseCase.call();
    result.fold((l) {
      emit(HomeGetProductsErrorState(message: l.message));
    }, (r) {
      allProducts = r;
      emit(HomeGetProductsSuccessState());
    });
  }
}
