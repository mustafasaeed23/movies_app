import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/theme/Colors.dart';
import 'package:movies_app/features/Browse/broswe_screen.dart';
import 'package:movies_app/features/Home/Presentation/screens/home_tab.dart';
import 'package:movies_app/features/Home/Presentation/widgets/nav_bar_icon.dart';
import 'package:movies_app/features/Search/search_tab.dart';
import 'package:movies_app/features/Watch%20List/watch_list_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _tabs = const [
    HomeTab(),
    BrosweScreen(),
    SearchScreen(),
    WatchListScreen(),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(15.r),
          topEnd: Radius.circular(15.r),
        ),
        child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: Offset(0, -6),
                  blurRadius: 6,
                  blurStyle: BlurStyle.outer,
                  color: AppColors.greyColor,
                ),
              ]),
              child: BottomNavigationBar(
                  backgroundColor: const Color(0xff1A1A1A).withOpacity(0.5),
                  onTap: (index) => setState(() => _currentIndex = index),
                  showUnselectedLabels: true,
                  items: [
                    BottomNavigationBarItem(
                      backgroundColor: AppColors.greyColor,
                      icon: NavBarIcon(
                          imagePath: "assets/icons/Home icon.svg",
                          isSelected: _currentIndex == 0),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarIcon(
                          imagePath: "assets/icons/search-2.svg",
                          isSelected: _currentIndex == 1),
                      label: "Search",
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarIcon(
                          imagePath: "assets/icons/Icon material-movie.svg",
                          isSelected: _currentIndex == 2),
                      label: "Browse",
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarIcon(
                          imagePath: "assets/icons/Icon ionic-md-bookmarks.svg",
                          isSelected: _currentIndex == 3),
                      label: "Watch List",
                    ),
                  ]),
            )),
      ),
      body: _tabs[_currentIndex],
    );
  }
}
