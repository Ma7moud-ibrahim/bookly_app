import 'package:bookly_app/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:bookly_app/Features/Home/presentation/view_model/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/views/details_view.dart';
import 'package:bookly_app/Features/Home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/core/utils/service_leactor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = 'homeView';
  static const kDetailsView = 'detailsView';
  static const kSearchView = 'SearchView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        routes: <RouteBase>[
          GoRoute(
            name: kHomeView,
            path: kHomeView,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeView();
            },
          ),
          GoRoute(
            name: kDetailsView,
            path: kDetailsView,
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider(
                create: (context) =>
                    SimilerBooksCubit(homeRepo: getIt<HomeRepo>()),
                child: DetailsView(bookModel: state.extra as BookModel),
              );
            },
          ),
          GoRoute(
            name: kSearchView,
            path: kSearchView,
            builder: (BuildContext context, GoRouterState state) {
              return const SearchView();
            },
          ),
        ],
      ),
    ],
  );
}
