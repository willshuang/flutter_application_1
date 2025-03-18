import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '首頁'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: '分類'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: '收藏'),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: '購物車',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '會員'),
      ],
      currentIndex: 0,
    );
  }
}

class WillsWomenPage extends StatelessWidget {
  const WillsWomenPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
