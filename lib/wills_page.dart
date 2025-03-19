import 'package:flutter/material.dart';

class WillsWomenPage extends StatelessWidget {
  const WillsWomenPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'LATIV 女裝',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 顶部横幅
            Text('顶部横幅'),
            // 分类导航
            Text('分类导航'),
            // 热门推荐
            Text('熱門推薦'),
            // 新品上市
            Text('新品上市'),
            // 特价商品
            Text('特價商品'),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

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
