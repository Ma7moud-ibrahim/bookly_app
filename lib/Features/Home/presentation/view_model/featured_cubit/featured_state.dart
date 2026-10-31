part of 'featured_cubit.dart';

sealed class FeathuredCubitState extends Equatable {
  const FeathuredCubitState();

  @override
  List<Object> get props => [];
}

final class FeathuredCubitInitial extends FeathuredCubitState {}

final class FeathuredCubitLoading extends FeathuredCubitState {}

final class FeathuredCubitSuccess extends FeathuredCubitState {
  final List<BookModel> books;

  const FeathuredCubitSuccess(this.books);
}

final class FeathuredCubitFailure extends FeathuredCubitState {
  final String errorMessage;

  const FeathuredCubitFailure(this.errorMessage);
}
