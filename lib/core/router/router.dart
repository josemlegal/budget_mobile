import 'package:budgetkp/presentation/dashboard/dashboard_view.dart';
import 'package:budgetkp/presentation/profile/views/profile_view.dart';
import 'package:budgetkp/presentation/transactions/views/transactions_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardView();
      },
      routes: [
        GoRoute(
          path: 'transactions',
          builder: (BuildContext context, GoRouterState state) {
            return const TransactionsView();
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileView();
          },
        ),
      ],
    ),
  ],
);
