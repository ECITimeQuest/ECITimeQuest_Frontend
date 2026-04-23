import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/features/home/presentation/pages/home_content.dart';
import 'package:flutter_app/features/home/presentation/widgets/bottom_navbar.dart';
import 'package:flutter_app/features/home/presentation/widgets/navbar_item.dart';
import 'package:flutter_app/features/learning/presentation/pages/question_page.dart';
import 'package:flutter_app/features/profile/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomeContent(),
    const QuestionPage(),
    const Placeholder(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Row(
          spacing: 8,
          children: [
            Icon(Icons.castle, color: AppColors.primary),
            Text("TimeQuest", style: TextStyle(color: AppColors.primary)),
          ],
        ),
        actions: [
          Container(margin: EdgeInsets.only(right: 15), child: NavbarItem()),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            30,
            20,
            MediaQuery.of(context).padding.bottom + 110,
          ),
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavBar(onTabChange: (index) => navigateBottomBar(index)),
      ),
    );
  }
}
