import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_all_products_use_case.dart';

part 'home_state.dart';

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

  void getAllProducts() async {
    var result = await getAllProductsUseCase.call();
    result.fold((l) {
      print(l.message);
      emit(HomeGetProductsErrorState(message: l.message));
    }, (r) {
      allProducts = r;
      print(allProducts.length);
      emit(HomeGetProductsSuccessState());
    });
  }
}
