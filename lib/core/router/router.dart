import 'package:budgetkp/presentation/dashboard/dashboard_view.dart';
import 'package:budgetkp/presentation/profile/views/profile_view.dart';
import 'package:budgetkp/presentation/transactions/views/transactions_view.dart';
import 'package:flutter/material.dart';

class Router {
  static const dashboardView = '/dashboard';
  static const transactionView = '/transaction';
  static const profileView = '/profile';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboardView:
        return MaterialPageRoute(builder: (_) => const DashboardView());
      case transactionView:
        return MaterialPageRoute(builder: (_) => const TransactionsView());
      case profileView:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      default:
        return MaterialPageRoute(builder: (_) => const DashboardView());
    }
  }
}
