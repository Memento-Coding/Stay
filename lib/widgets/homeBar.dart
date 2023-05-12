import 'package:flutter/material.dart';


class HomeBar extends StatelessWidget {
  const HomeBar({
    Key? key,
    
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm),label: "Hsde"),
        ],
       ),
    );
      
  }
}