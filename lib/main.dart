import 'package:clean_arc/core/resources/my_block_observer.dart';
import 'package:clean_arc/core/resources/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'core/constantd.dart';
import 'core/network/hive.dart';
import 'features/home/domain/entitys/book_entity.dart';

void main() async {
  await HiveHelper.init();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBooks);
  await Hive.openBox<BookEntity>(kNewsBooks);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      home: Container(),
      routes: const {},
    );
  }
}
