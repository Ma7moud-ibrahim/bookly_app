import 'package:bookly_app/Features/Home/data/model/book_mode/book_model..dart';
import 'package:bookly_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Faliures, List<BookModel>>> fetchNewestSellerBooks();
  Future<Either<Faliures, List<BookModel>>> fetchFeaturedBooks();
}
