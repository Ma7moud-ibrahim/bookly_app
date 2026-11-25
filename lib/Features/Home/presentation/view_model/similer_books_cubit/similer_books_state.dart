part of 'similer_books_cubit.dart';

sealed class SimilerBooksState extends Equatable {
  const SimilerBooksState();

  @override
  List<Object> get props => [];
}

final class SimilerBooksInitial extends SimilerBooksState {}

final class SimilerBooksLoading extends SimilerBooksState {}

final class SimilerBooksSucsses extends SimilerBooksState {
  final List<BookModel> books;

  const SimilerBooksSucsses(this.books);
}

final class SimilerBooksFailure extends SimilerBooksState {
  final String errorMessage;

  const SimilerBooksFailure(this.errorMessage);
}
