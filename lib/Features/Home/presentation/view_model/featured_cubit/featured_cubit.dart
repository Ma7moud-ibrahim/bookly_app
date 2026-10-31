import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Home/data/model/book_mode/book_model..dart';
import 'package:equatable/equatable.dart';

part 'featured_state.dart';

class FeaturedCubit extends Cubit<FeathuredCubitState> {
  FeaturedCubit() : super(FeathuredCubitInitial());
}
