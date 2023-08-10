import 'package:flutter/material.dart';
import 'package:valu_challenge/features/product_details/presentation/pages/product_details.dart';

import '../../features/home/domain/entities/product_entity.dart';
import '../../features/home/presentation/pages/home.dart';
import 'routes.dart';

class AppRoutes {
  static Route? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.details:
        ProductEntity args = routeSettings.arguments as ProductEntity;
        return MaterialPageRoute(builder: (context) => ProductDetails(args));

      default:
        return null;
    }
  }
}
