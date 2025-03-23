import 'package:clean_arc/features/home/domain/entitys/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failuer.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failuer, List<BookEntity>>> fetchNewsBooks();
}
