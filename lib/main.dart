import 'package:flutter/material.dart';
import 'package:konaf_skora/src/app.dart';

import 'core/data/cached/cache_helper.dart';
import 'core/services/service_locator.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await getIt<CacheHelper>().init();
 // await EasyLocalization.ensureInitialized();
  runApp(const MyApp());
}
