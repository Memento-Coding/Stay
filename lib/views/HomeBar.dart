import 'package:flutter/material.dart';
import 'package:stay/router/stay_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({super.key});

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppRoutes(index: _selectedIndex).miPages(),
      bottomNavigationBar: Container(
        color: Colors.grey[200],
        child: GNav(
          backgroundColor: Colors.transparent,
          color: Colors.red,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 8,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          tabs: const [
            GButton(icon: Icons.home,text: 'Home',),
            //GButton(icon: Icons.favorite_border,text: 'Like',),
            GButton(icon: Icons.person,text: 'Profile',)
          ],
          onTabChange: (index){
            _onItemTapped(index);
          },
        ),
      ),
    );
  }
}
