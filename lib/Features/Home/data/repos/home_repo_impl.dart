import 'package:bookly_app/Features/Home/data/model/book_mode/book_model..dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  new(this.apiService);
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestSellerBooks() async {
    try {
      var date = await apiService.get(
        endPoint: 'volumes?q=programming&Filtering=free-ebook&Sorting=newest',
      );
      List<BookModel> books = [];
      for (var item in date['items']) {
        books.add(item);
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var date = await apiService.get(
        endPoint: 'volumes?q=programming&Filtering=free-ebook',
      );
      List<BookModel> books = [];
      for (var item in date['items']) {
        books.add(item);
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure('Unexpected error: $e'));
    }
  }
}
