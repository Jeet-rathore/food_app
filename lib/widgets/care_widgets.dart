import 'package:flutter/material.dart';

void main() => runApp(const ChickenStoreApp());

class ChickenStoreApp extends StatelessWidget {
  const ChickenStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChickenStorePage(),
    );
  }
}

class ChickenStorePage extends StatelessWidget {
  const ChickenStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {},
        ),
        title: const Text(''),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Row(
        children: const [
          Expanded(flex: 3, child: ProductListView()),
          Expanded(flex: 1, child: CategoryStackView()),
        ],
      ),
    );
  }
}

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  final List<ChickenProduct> wholeChickenProducts = const [
    ChickenProduct(
      title: 'Fresh Whole Chicken',
      center: 'L2M Chicken Center',
      time: '15-20 Mins',
      weight: '1 KG',
      price: 580.00,
      mrp: 620.00,
      discountPercentage: 10,
      imageUrl: 'assets/chicken1.jpg',
      isDiscounted: true,
      isFavorite: false,
    ),
    ChickenProduct(
      title: 'Whole Chicken',
      center: 'L2M Chicken Center',
      time: '12-30 Mins',
      weight: '1 KG',
      price: 260.00,
      mrp: null,
      discountPercentage: null,
      imageUrl: 'assets/chicken2.jpg',
      isDiscounted: false,
      isFavorite: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          const FilterBar(),
          _buildCategorySection('Whole Chicken', wholeChickenProducts),
        ],
      ),
    );
  }

  Widget _buildCategorySection(String title, List<ChickenProduct> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              return ProductContainer(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}

class ProductContainer extends StatelessWidget {
  final ChickenProduct product;

  const ProductContainer({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  product.imageUrl,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Icon(Icons.image, size: 40, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              if (product.isDiscounted && product.discountPercentage != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${product.discountPercentage}% OFF',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.center,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  product.time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '₹${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (product.mrp != null)
                      Text(
                        '₹${product.mrp!.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          _filterChip(
            Icons.tune,
            'Filters',
            Colors.blue.shade700,
            Colors.white,
          ),
          _filterChip(
            Icons.store,
            'Near Stores',
            Colors.white,
            Colors.black87,
            border: true,
          ),
          _filterChip(
            Icons.arrow_upward,
            'Low to High',
            Colors.white,
            Colors.black87,
            border: true,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: const Icon(Icons.menu, color: Colors.grey, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(
    IconData icon,
    String label,
    Color bgColor,
    Color textColor, {
    bool border = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
        border: border ? Border.all(color: Colors.grey.shade300) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: textColor, size: 16),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(color: textColor, fontSize: 13)),
        ],
      ),
    );
  }
}

class CategoryStackView extends StatelessWidget {
  const CategoryStackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: const Center(
        child: Text('Categories Here', style: TextStyle(color: Colors.black54)),
      ),
    );
  }
}

class ChickenProduct {
  final String title;
  final String center;
  final String time;
  final String weight;
  final double price;
  final double? mrp;
  final int? discountPercentage;
  final String imageUrl;
  final bool isDiscounted;
  final bool isFavorite;

  const ChickenProduct({
    required this.title,
    required this.center,
    required this.time,
    required this.weight,
    required this.price,
    this.mrp,
    this.discountPercentage,
    required this.imageUrl,
    required this.isDiscounted,
    required this.isFavorite,
  });
}
