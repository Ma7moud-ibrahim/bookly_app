import 'package:bookly_app/Features/Home/data/model/book_mode/book_model..dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fetchNewestSellerBooks();
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks();
}
