import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injection/injection_container.dart';
import '../cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(networkInfo: getIt(),getAllProductsUseCase:  getIt())
            ..listenToNetworkConnection()
            ..getAllProducts(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
          );
        },
      ),
    );
  }
}
