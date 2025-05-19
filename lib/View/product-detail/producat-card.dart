import 'package:flutter/material.dart';

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
        children: [
          // Left side - Product List (Taking 75% of width)
          Expanded(flex: 3, child: ProductListView()),

          // Right side - Category Stack (Taking 25% of width)
          Expanded(flex: 1, child: CategoryStackView()),
        ],
      ),
    );
  }
}

class ProductListView extends StatelessWidget {
  ProductListView({Key? key}) : super(key: key);

  final List<ChickenProduct> wholeChickenProducts = [
    ChickenProduct(
      title: 'Fresh Whole Chicken',
      center: 'L2M Chicken Center',
      time: '15-20 Mins',
      weight: '1 KG',
      price: 580.00,
      mrp: 620.00,
      discountPercentage: 10,
      imageUrl: 'assets/images/1.png',
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
      imageUrl: 'assets/images/1.png',
      isDiscounted: false,
      isFavorite: true,
    ),
    ChickenProduct(
      title: 'Premium Whole Chicken',
      center: 'L2M Chicken Center',
      time: '15-20 Mins',
      weight: '1 KG',
      price: 340.00,
      mrp: 380.00,
      discountPercentage: 10,
      imageUrl: 'assets/chicken5.jpg',
      isDiscounted: true,
      isFavorite: false,
    ),
  ];

  final List<ChickenProduct> biryaniChickenProducts = [
    ChickenProduct(
      title: 'Skinless Biryani Cut',
      center: 'L2M Chicken Center',
      time: '12-30 Mins',
      weight: '1 KG',
      price: 340.00,
      mrp: 380.00,
      discountPercentage: 10,
      imageUrl: 'assets/chicken3.jpg',
      isDiscounted: true,
      isFavorite: false,
    ),
    ChickenProduct(
      title: 'Special Biryani Cut',
      center: 'L2M Chicken Center',
      time: '12-30 Mins',
      weight: '1 KG',
      price: 340.00,
      mrp: 380.00,
      discountPercentage: 10,
      imageUrl: 'assets/chicken4.jpg',
      isDiscounted: true,
      isFavorite: false,
    ),
    ChickenProduct(
      title: 'Jumbo Biryani Cut',
      center: 'L2M Chicken Center',
      time: '15-20 Mins',
      weight: '1 KG',
      price: 360.00,
      mrp: 400.00,
      discountPercentage: 10,
      imageUrl: 'assets/chicken3.jpg',
      isDiscounted: true,
      isFavorite: false,
    ),
  ];

  final List<ChickenProduct> freshChickenProducts = [
    ChickenProduct(
      title: 'Fresh Chicken Legs',
      center: 'L2M Chicken Center',
      time: '15-20 Mins',
      weight: '1 KG',
      price: 380.00,
      mrp: 420.00,
      discountPercentage: 10,
      imageUrl: 'assets/chicken5.jpg',
      isDiscounted: true,
      isFavorite: false,
    ),
    ChickenProduct(
      title: 'Fresh Chicken Breast',
      center: 'L2M Chicken Center',
      time: '12-30 Mins',
      weight: '1 KG',
      price: 420.00,
      mrp: 470.00,
      discountPercentage: 10,
      imageUrl: 'assets/chicken1.jpg',
      isDiscounted: true,
      isFavorite: false,
    ),
    ChickenProduct(
      title: 'Fresh Chicken Wings',
      center: 'L2M Chicken Center',
      time: '15-20 Mins',
      weight: '1 KG',
      price: 340.00,
      mrp: 380.00,
      discountPercentage: 10,
      imageUrl: 'assets/chicken2.jpg',
      isDiscounted: true,
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          // Top filters section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.tune, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Filters',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.store, color: Colors.grey, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Near Stores',
                          style: TextStyle(color: Colors.black87, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_upward, color: Colors.grey, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Low to High',
                          style: TextStyle(color: Colors.black87, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: const Icon(Icons.menu, color: Colors.grey, size: 16),
                  ),
                ],
              ),
            ),
          ),

          // Whole Chicken Section
          _buildCategorySection('Whole Chicken', wholeChickenProducts),

          const SizedBox(height: 20),

          // Biryani Chicken Section
          _buildCategorySection('Biryani Chicken', biryaniChickenProducts),

          const SizedBox(height: 20),

          // Fresh Chicken Section
          _buildCategorySection('Fresh Chicken', freshChickenProducts),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCategorySection(String title, List<ChickenProduct> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
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

        // Horizontal scrollable product containers
        SizedBox(
          // Increased height to fix overflow issue
          height: 240, // Original was 220
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
        mainAxisSize: MainAxisSize.min, // Added this to prevent over-expansion
        children: [
          // Product Image with overlays
          Stack(
            children: [
              // Product image
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
                  // Use a placeholder for the demo
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

              // Discount badge
              if (product.isDiscounted && product.discountPercentage != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
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

              // Favorite button
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorite ? Colors.red : Colors.grey,
                      size: 18,
                    ),
                    onPressed: () {},
                    constraints: const BoxConstraints(
                      minHeight: 30,
                      minWidth: 30,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),

          // Product details - Wrap in Expanded to fix overflow
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Prevent over-expansion
                children: [
                  // Product name
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // Delivery time and weight
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        product.time,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        product.weight,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Price section
                  Row(
                    children: [
                      Text(
                        '₹ ${product.price.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      if (product.isDiscounted && product.mrp != null)
                        Text(
                          'MRP ₹${product.mrp!.toStringAsFixed(0)}',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 4), // Reduced from 8 to save space
                  // Add button
                  Container(
                    width: double.infinity,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.add, color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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

  ChickenProduct({
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

class CategoryStackView extends StatelessWidget {
  CategoryStackView({Key? key}) : super(key: key);

  final List<CategoryItem> categories = [
    CategoryItem(
      name: 'Chicken All varieties',
      imageUrl: 'assets/chicken_category.png',
      isSelected: true,
    ),
    CategoryItem(
      name: 'Fish All Varieties',
      imageUrl: 'assets/fish_category.png',
      isSelected: false,
    ),
    CategoryItem(
      name: 'Mutton All Varieties',
      imageUrl: 'assets/mutton_category.png',
      isSelected: false,
    ),
    CategoryItem(
      name: 'All Varieties of red food',
      imageUrl: 'assets/red_food_category.png',
      isSelected: false,
    ),
    CategoryItem(
      name: 'Fresh Pork',
      imageUrl: 'assets/pork_category.png',
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}

class CategoryItem {
  final String name;
  final String imageUrl;
  final bool isSelected;

  CategoryItem({
    required this.name,
    required this.imageUrl,
    this.isSelected = false,
  });
}

class CategoryCard extends StatelessWidget {
  final CategoryItem category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        children: [
          // Category container - Fixed the background color issue
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              // Color is now conditional based on isSelected
              color: category.isSelected ? Colors.amber : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border:
                  category.isSelected
                      ? Border.all(color: Colors.orange, width: 2)
                      : Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Center(
              child: Image.asset(
                category.imageUrl,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image, color: Colors.grey, size: 30);
                },
              ),
            ),
          ),

          const SizedBox(height: 4),

          // Category name
          SizedBox(
            width: 80,
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight:
                    category.isSelected ? FontWeight.bold : FontWeight.w500,
                color: category.isSelected ? Colors.orange : Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
