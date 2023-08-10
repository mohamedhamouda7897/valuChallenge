import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valu_challenge/config/routes/routes.dart';
import 'package:valu_challenge/core/utils/app_colors.dart';
import 'package:valu_challenge/features/home/presentation/cubit/home_cubit.dart';

import '../../../../config/injection/injection_container.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..listenToNetworkConnection()
        ..getAllProducts(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeNotConnectedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Disconnected')));
          }
          if (state is HomeConnectedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Connected')));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              title:  Text("Valu Challenge",style: GoogleFonts.elMessiri(
                fontSize: 26.sp
              ),),
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.h,
                  crossAxisSpacing: 15.w,
                  childAspectRatio: 9 / 12),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.details,
                        arguments: HomeCubit.get(context).allProducts[index]);
                  },
                  child: ProductItem(
                    productEntity: HomeCubit.get(context).allProducts[index],
                  ),
                );
              },
              itemCount: HomeCubit.get(context).allProducts.length,
            ),
          );
        },
      ),
    );
  }
}
