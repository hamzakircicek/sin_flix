import 'package:flutter/material.dart';
import 'package:movie_app/view/widgets/bottom_navbar_buttons.dart';

class BottomNavbar extends StatelessWidget {
  final PageController pageController;
  const BottomNavbar({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomNavBarButton(
            label: 'Anasayfa',
            radious: BorderRadius.circular(35),
            assetPath: 'assets/Home.png',
            function: () {
              pageController.animateToPage(
                0,
                duration: Duration(milliseconds: 150),
                curve: Curves.easeIn,
              );
            },
          ),
          BottomNavBarButton(
            label: 'Profil',
            radious: BorderRadius.circular(35),
            assetPath: 'assets/Profile.png',
            function: () {
              pageController.animateToPage(
                1,
                duration: Duration(milliseconds: 150),
                curve: Curves.easeIn,
              );
            },
          ),
        ],
      ),
    );
  }
}
