import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit({required this.homeRepo}) : super(SimilerBooksInitial());
  final HomeRepo homeRepo;

  Future<void> featchSimilarBooks({required String category}) async {
    emit(SimilerBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(SimilerBooksFailure(failure.errorMessage));
      },
      (books) {
        emit(SimilerBooksSucsses(books));
      },
    );
  }
}
