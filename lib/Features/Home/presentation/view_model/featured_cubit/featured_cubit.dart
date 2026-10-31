import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Home/data/model/book_mode/book_model..dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_state.dart';

class FeaturedCubit extends Cubit<FeathuredCubitState> {
  FeaturedCubit(this.homeRepo) : super(FeathuredCubitInitial());

  final HomeRepo homeRepo;

  Future<void> featchFeatchuredBooks() async {
    emit(FeathuredCubitLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(FeathuredCubitFailure(failure.errorMessage));
      },
      (books) {
        emit(FeathuredCubitSuccess(books));
      },
    );
  }
}
