import 'package:flutter/material.dart';

// 主页面
class LativWomenPage extends StatelessWidget {
  const LativWomenPage({super.key});

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
            BannerSection(),

            // 分类导航
            CategoryNavigation(),

            // 热门推荐
            SectionTitle(title: '熱門推薦'),
            HotRecommendation(),

            // 新品上市
            SectionTitle(title: '新品上市'),
            NewArrivalsGrid(),

            // 特价商品
            SectionTitle(title: '特價商品'),
            SpecialOfferGrid(),

            // 底部信息
            FooterInfo(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

// 顶部横幅
class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 横幅图片
        Container(
          height: 200,
          width: double.infinity,
          child: Image.asset(
            'assets/images/main_top_00.jpg',
            fit: BoxFit.cover,
          ),
        ),
        // 横幅指示器
        // Positioned(
        //   bottom: 10,
        //   left: 0,
        //   right: 0,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: List.generate(
        //       3,
        //       (index) => Container(
        //         margin: const EdgeInsets.symmetric(horizontal: 4),
        //         width: 8,
        //         height: 8,
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: index == 0 ? Colors.black : Colors.grey[300],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

// 分类导航
class CategoryNavigation extends StatelessWidget {
  const CategoryNavigation({super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            categories.map((category) {
              return CategoryItem(
                icon: category['icon'] as IconData,
                name: category['name'] as String,
              );
            }).toList(),
      ),
    );
  }
}

// 分类项目
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

// 区块标题
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
          const Text(
            '查看全部',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// 热门推荐
class HotRecommendation extends StatelessWidget {
  const HotRecommendation({super.key});

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

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: 120,
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 商品图片
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
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
            ),
          );
        },
      ),
    );
  }
}

// 新品上市网格
class NewArrivalsGrid extends StatelessWidget {
  const NewArrivalsGrid({super.key});

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            image: product['image'],
            title: product['title'],
            price: product['price'],
            isNew: true,
          );
        },
      ),
    );
  }
}

// 特价商品网格
class SpecialOfferGrid extends StatelessWidget {
  const SpecialOfferGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'image': 'assets/images/so_00.jpeg',
        'title': '舒適休閒褲',
        'price': 'NT\$390',
        'originalPrice': 'NT\$490',
      },
      {
        'image': 'assets/images/so_01.jpeg',
        'title': '基本款襯衫',
        'price': 'NT\$450',
        'originalPrice': 'NT\$550',
      },
      {
        'image': 'assets/images/so_02.jpeg',
        'title': '時尚短袖T恤',
        'price': 'NT\$290',
        'originalPrice': 'NT\$390',
      },
      {
        'image': 'assets/images/so_03.jpeg',
        'title': '百搭牛仔褲',
        'price': 'NT\$590',
        'originalPrice': 'NT\$690',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            image: product['image'],
            title: product['title'],
            price: product['price'],
            originalPrice: product['originalPrice'],
            isNew: false,
          );
        },
      ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
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

// 底部信息
class FooterInfo extends StatelessWidget {
  const FooterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.grey[100],
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '關於LATIV',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'LATIV 是台灣知名的服裝品牌,提供高品質、平價的基本款服飾。我們致力於為顧客提供舒適、實用且時尚的服裝選擇。',
            style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FooterIconItem(icon: Icons.local_shipping, label: '免運配送'),
              FooterIconItem(icon: Icons.refresh, label: '7天鑑賞期'),
              FooterIconItem(icon: Icons.support_agent, label: '客服支援'),
            ],
          ),
        ],
      ),
    );
  }
}

// 底部图标项
class FooterIconItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const FooterIconItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.black54),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}

// 底部导航栏
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
