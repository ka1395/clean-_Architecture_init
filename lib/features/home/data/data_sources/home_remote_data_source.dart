import 'package:clean_arc/core/network/dio.dart';
import 'package:clean_arc/features/home/data/book_model/book_model.dart';

import '../../../../core/constantd.dart';
import '../../../../core/network/hive.dart';
import '../../domain/entitys/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewsBooks();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var response = await DioHelper.get(url: fetchBooksEndPoint);
    List<BookEntity> books = getBooksList(response.data);
     HiveHelper.saveBooksData(kFeaturedBooks, books);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsBooks() async {
    var response = await DioHelper.get(url: fetchNewsEndPoint);
    List<BookEntity> books = getBooksList(response.data);
     HiveHelper.saveBooksData(kNewsBooks, books);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
