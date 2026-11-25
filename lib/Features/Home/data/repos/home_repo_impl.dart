import 'package:bookly_app/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  new(this.apiService);
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestSellerBooks() async {
    try {
      var date = await apiService.get(
        endPoint:
            'volumes?q=subject:programming&filter=free-ebooks&orderBy=newest',
      );
      List<BookModel> books = [];
      for (var item in date['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
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
        books.add(BookModel.fromJson(item as Map<String, dynamic>));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilerBooks({
    required String category,
  }) async {
    try {
      final q = Uri.encodeQueryComponent('subject:$category');
      var data = await apiService.get(
        endPoint: 'volumes?q=$q&filter=free-ebooks&orderBy=relevance',
      );
      List<BookModel> books = [];
      for (var item in (data['items'] ?? [])) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure('Unexpected error: $e'));
    }
  }
}
