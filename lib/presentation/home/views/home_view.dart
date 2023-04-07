import 'package:budgetkp/core/dependency_injection/locator.dart';
import 'package:budgetkp/core/theme/theme.dart';
import 'package:budgetkp/presentation/auth/views/onboarding_view.dart';
import 'package:budgetkp/presentation/dashboard/views/dashboard_view.dart';
import 'package:budgetkp/presentation/home/controller/home_view_controller.dart';
import 'package:budgetkp/presentation/transactions/views/transactions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:stacked_services/stacked_services.dart' as services;

class HomeView extends StatefulHookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  bool isLoading = true;

  int _selectedPageIndex = 0;

  final List<Map<String, String>> _routes = [
    {
      'path': '/dashboard',
      'icon': 'assets/images/home_icon.svg',
    },
    {
      'path': '/challenges',
      'icon': 'assets/images/challenges.svg',
    },
    {
      'path': '/social',
      'icon': 'assets/images/social.svg',
    },
    {
      'path': '/profile',
      'icon': 'assets/images/profile.svg',
    },
  ];

  @override
  // void initState() {
  //   WidgetsBinding.instance!.addPostFrameCallback((_) async {
  //     await ref.read(homeViewProvider).fetchAppData();

  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final _homeViewController = ref.watch(homeViewProvider);
    bool isVisible = true;
    Widget _getSelectedPage(int index) {
      switch (index) {
        case 0:
          return const DashboardView();

        case 1:
          return const TransactionsView();

        default:
          return const OnboardingView();
      }
    }

    void changeSelectedPageIndex(index) {
      setState(() {
        _selectedPageIndex = index;
      });
    }

    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _getSelectedPage(_selectedPageIndex),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accent,
        onPressed: () {
          _homeViewController.goToTransactionsView();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 3, right: 3),
          child: SvgPicture.asset(
            'assets/images/route.svg',
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: isVisible
          ? BottomAppBar(
              shape: const CircularNotchedRectangle(),
              clipBehavior: Clip.antiAlias,
              notchMargin: 8,
              child: Container(
                key: UniqueKey(),
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(112, 39, 207, 0.149),
                      blurRadius: 60,
                      offset: Offset(0, 15),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: BottomNavigationBar(
                      selectedFontSize: 0,
                      showSelectedLabels: false,
                      type: BottomNavigationBarType.fixed,
                      showUnselectedLabels: false,
                      items: <BottomNavigationBarItem>[
                        ..._routes
                            .map((route) => BottomNavigationBarItem(
                                  icon: Padding(
                                    padding: EdgeInsets.only(
                                        right: _routes.indexOf(route) == 2
                                            ? 0
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                        left: _routes.indexOf(route) == 1
                                            ? 0
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 20, top: 8),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: _routes.indexOf(route) ==
                                                      _selectedPageIndex
                                                  ? AppColors.accent
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            margin: const EdgeInsets.only(
                                                bottom: 11),
                                            height: 4,
                                            width: 30,
                                          ),
                                          SvgPicture.asset(
                                            route['icon']!,
                                            color: _routes.indexOf(route) ==
                                                    _selectedPageIndex
                                                ? AppColors.accent
                                                : AppColors.neutral,
                                            height: 21,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  label: "",
                                ))
                            .toList()
                      ],
                      currentIndex: _selectedPageIndex,
                      selectedItemColor: AppColors.primary,
                      unselectedItemColor: AppColors.neutral,
                      onTap: (index) {
                        if (index == 0 || index == 1) {
                          final services.SnackbarService _snackbarService =
                              locator<services.SnackbarService>();
                          _snackbarService.showSnackbar(
                            message: "Coming soon!",
                          );
                          return;
                        }
                        changeSelectedPageIndex(index);
                      },
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
