import 'package:budgetkp/core/dependency_injection/locator.dart';
import 'package:budgetkp/core/theme/theme.dart';
import 'package:budgetkp/presentation/auth/views/onboarding_view.dart';
import 'package:budgetkp/presentation/dashboard/views/dashboard_view.dart';
import 'package:budgetkp/presentation/profile/views/profile_view.dart';
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
  bool isLoading = false;

  int selectedPageIndex = 1;

  final List<Map<String, String>> routes = [
    {
      'path': '/dashboard',
      'icon': 'assets/images/dashboard.svg',
    },
    {
      'path': '/transaction',
      'icon': 'assets/images/transaction.svg',
    },
    {
      'path': '/profile',
      'icon': 'assets/images/profile.svg',
    },
  ];

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    bool isVisible = true;
    Widget getSelectedPage(int index) {
      switch (index) {
        case 0:
          return const DashboardView();

        case 1:
          return const TransactionsView();

        case 2:
          return const ProfileView();

        default:
          return const OnboardingView();
      }
    }

    void changeSelectedPageIndex(index) {
      setState(() {
        selectedPageIndex = index;
      });
    }

    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : getSelectedPage(selectedPageIndex),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.accent,
      //   onPressed: () {
      //     _homeViewController.goToTransactionsView();
      //   },
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 3, right: 3),
      //     child: SvgPicture.asset(
      //       'assets/images/transaction.svg',
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                        ...routes
                            .map(
                              (route) => BottomNavigationBarItem(
                                icon: Padding(
                                  padding: EdgeInsets.only(
                                      right: routes.indexOf(route) == 2
                                          ? 0
                                          : MediaQuery.of(context).size.width *
                                              0.1,
                                      left: routes.indexOf(route) == 1
                                          ? 0
                                          : MediaQuery.of(context).size.width *
                                              0.1),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 20, top: 8),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: routes.indexOf(route) ==
                                                    selectedPageIndex
                                                ? AppColors.accent
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          margin:
                                              const EdgeInsets.only(bottom: 11),
                                          height: 4,
                                          width: 30,
                                        ),
                                        SvgPicture.asset(
                                          route['icon']!,
                                          color: routes.indexOf(route) ==
                                                  selectedPageIndex
                                              ? AppColors.accent
                                              : AppColors.neutral,
                                          height: 21,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                label: "",
                              ),
                            )
                            .toList()
                      ],
                      currentIndex: selectedPageIndex,
                      selectedItemColor: AppColors.primary,
                      unselectedItemColor: AppColors.neutral,
                      onTap: (index) {
                        if (index == 0 || index == 2) {
                          final services.SnackbarService snackbarService =
                              locator<services.SnackbarService>();
                          snackbarService.showSnackbar(
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
