import 'package:budgetkp/core/dependency_injection/locator.dart';
import 'package:budgetkp/presentation/transactions/views/transactions_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewController extends ChangeNotifier {
  final NavigationService _navigationService;

  HomeViewController({required navigationService})
      : _navigationService = navigationService;

  Future<void> goToTransactionsView() async {
    await _navigationService.navigateToView(const TransactionsView());
  }
}

final homeViewProvider = ChangeNotifierProvider(
  (ref) => HomeViewController(
    navigationService: locator<NavigationService>(),
  ),
);
