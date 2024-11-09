import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';
import 'package:term/screens/home_page.dart';
import 'package:term/screens/profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedPageIndex = 0;
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          HomePage(),
          ProfilePage(),
          Scaffold(),
          Scaffold(),
          Scaffold(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_outlined), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Students'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
        backgroundColor: AppColors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 125, 181, 188),
      ),
    );
  }
}
