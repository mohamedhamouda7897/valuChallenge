import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'config/injection/injection_container.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(const StoreApp(route: "/"));
}
