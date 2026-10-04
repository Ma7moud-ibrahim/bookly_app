import 'package:bookly_app/Features/Home/presentation/views/details_view.dart';
import 'package:bookly_app/Features/Home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = 'homeView';
  static const kDetailsView = 'detailsView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        routes: <RouteBase>[
          GoRoute(
            name: kHomeView, // ← أضفنا الاسم
            path: kHomeView,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeView();
            },
          ),
          GoRoute(
            name: kDetailsView, // ← أضفنا الاسم
            path: kDetailsView,
            builder: (BuildContext context, GoRouterState state) {
              return const DetailsView();
            },
          ),
        ],
      ),
    ],
  );
}
