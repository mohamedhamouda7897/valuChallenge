import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/app_route.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: route,
          onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
        );
      },
    );
  }
}
