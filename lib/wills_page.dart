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
            BannerSection(), // 頂部横幅
            CategorySection(), // 分類導航
            SectionTitle(title: '熱門推薦'),
            HotSection(),
            SectionTitle(title: '新品上市'),
            NewSection(),
            // 特价商品
            Text('特價商品'),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

// 區段標題
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text('查看全部', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}

// 頂部横幅
class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Image.asset('assets/images/main_top_00.jpg', fit: BoxFit.cover),
    );
  }
}

// 分類導航
class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.checkroom, 'name': '上衣'},
      {'icon': Icons.accessibility_new, 'name': '褲裝'},
      {'icon': Icons.face, 'name': '內著'},
      {'icon': Icons.beach_access, 'name': '配件'},
      {'icon': Icons.local_offer, 'name': '特惠'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            categories.map((item) {
              return CategoryItem(
                icon: item['icon'] as IconData,
                name: item['name'] as String,
              );
            }).toList(),
      ),
    );
  }
}

// 分類單項
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String name;

  const CategoryItem({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.black54),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

//熱門推薦
class HotSection extends StatelessWidget {
  const HotSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'image': 'assets/images/hot_00.jpeg',
        'name': '基本款T恤',
        'price': 'NT\$299',
      },
      {
        'image': 'assets/images/hot_01.jpeg',
        'name': '休閒襯衫',
        'price': 'NT\$399',
      },
      {
        'image': 'assets/images/hot_02.jpeg',
        'name': '牛仔短褲',
        'price': 'NT\$499',
      },
      {
        'image': 'assets/images/hot_03.jpeg',
        'name': '針織外套',
        'price': 'NT\$590',
      },
      {
        'image': 'assets/images/hot_04.jpeg',
        'name': '休閒長褲',
        'price': 'NT\$690',
      },
    ];
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  width: 90,
                  margin: const EdgeInsets.only(right: 16),
                  child: HotItem(product: product),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

//熱推單項
class HotItem extends StatelessWidget {
  const HotItem({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 商品图片
        Container(
          height: 120,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(product['image'], fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        // 商品名称
        Text(
          product['name'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 4),
        // 商品价格
        Text(
          product['price'],
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

// 商品卡片
class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String? originalPrice;
  final bool isNew;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    this.originalPrice,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 商品图片和标签
        Stack(
          children: [
            // 商品图片
            Container(
              height: 180,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            // 新品标签
            if (isNew)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            // 特价标签
            if (originalPrice != null)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'SALE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        // 商品名称
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 2),
        // 商品价格
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              price,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            if (originalPrice != null) ...[
              const SizedBox(width: 8),
              Text(
                originalPrice!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

// 新品上市
class NewSection extends StatelessWidget {
  const NewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'image': 'assets/images/arr_00.jpeg',
        'title': '春季新款連衣裙',
        'price': 'NT\$590',
      },
      {
        'image': 'assets/images/arr_01.jpeg',
        'title': '輕薄防曬外套',
        'price': 'NT\$690',
      },
      {
        'image': 'assets/images/arr_02.jpeg',
        'title': '時尚休閒套裝',
        'price': 'NT\$790',
      },
      {
        'image': 'assets/images/arr_03.jpeg',
        'title': '舒適針織衫',
        'price': 'NT\$490',
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children:
                  products.map((product) {
                    return SizedBox(
                      width: 160,
                      child: ProductCard(
                        image: product['image'],
                        title: product['title'],
                        price: product['price'],
                        isNew: true,
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
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
