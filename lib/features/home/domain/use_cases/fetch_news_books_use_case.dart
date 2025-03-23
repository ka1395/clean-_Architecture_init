import 'package:dartz/dartz.dart';

import '../../../../core/error/failuer.dart';
import '../../../../core/use_case/use_case.dart';
import '../entitys/book_entity.dart';
import '../repos/home_repo.dart';

class FetchNewsBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchNewsBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failuer, List<BookEntity>>> call([NoParam? param]) {
    return homeRepo.fetchNewsBooks();
  }
}
