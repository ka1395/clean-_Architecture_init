import 'package:clean_arc/features/home/domain/entitys/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

class HiveHelper {
  static init() async{
   await Hive.initFlutter();
  }

  static saveBooksData(String key, List<BookEntity> data) {
    var box =  Hive.box<BookEntity>(key);
    box.addAll(data);
  }
}
