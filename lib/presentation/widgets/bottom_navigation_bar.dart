import 'package:budgetkp/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavbar extends StatefulWidget {
  final Function(int index) onSelectedPageChanged;

  const CustomBottomNavbar({
    Key? key,
    required this.onSelectedPageChanged,
  }) : super(key: key);

  @override
  _CustomBottomNavbarState createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    final List<String> _routes = [
      '/dashboard',
      '/challenges',
      '/navigation',
      '/social',
      '/profile',
    ];

    Map<String, String> icons = {
      "/dashboard": "assets/images/home_icon.svg",
      "/challenges": "assets/images/challenges.svg",
      "/navigation": "assets/images/route.svg",
      "/social": "assets/images/social.svg",
      "/profile": "assets/images/profile.svg",
    };

    int _selectedPageIndex = 0;

    void changeSelectedPageIndex(index) {
      setState(() {
        _selectedPageIndex = index;
      });
      widget.onSelectedPageChanged(index);
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(18, 2, 39, 0.15),
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
        child: BottomNavigationBar(
          selectedFontSize: 0,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            for (var route in _routes)
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 8),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: _routes.indexOf(route) == _selectedPageIndex
                              ? AppColors.accent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        margin: const EdgeInsets.only(bottom: 11),
                        height: 4,
                        width: 30,
                      ),
                      SvgPicture.asset(
                        icons[route]!,
                        color: _routes.indexOf(route) == _selectedPageIndex
                            ? AppColors.accent
                            : AppColors.neutral,
                        height: 21,
                      ),
                    ],
                  ),
                ),
                label: "",
              ),
          ],
          currentIndex: _selectedPageIndex,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.neutral,
          onTap: (index) {
            // if (index == 3) {
            //   final services.SnackbarService _snackbarService =
            //       locator<services.SnackbarService>();
            //   _snackbarService.showSnackbar(
            //     message: "Coming soon!",
            //   );
            //   return;
            // }
            changeSelectedPageIndex(index);
          },
        ),
      ),
    );
  }
}
