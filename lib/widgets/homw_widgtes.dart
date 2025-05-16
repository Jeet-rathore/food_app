import 'package:flutter/material.dart';

class CategoryWidgets {
  /// Creates a category container with a grid of images and category text
  static Widget categoryContainer({
    required String categoryName,
    required List<String> imagePaths,
    required Color backgroundColor,
    required Color textBackgroundColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Grid of images
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                        ),
                    itemCount: imagePaths.length > 6 ? 6 : imagePaths.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.image_not_supported,
                              size: 20,
                              color: Colors.grey[600],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            // Category text
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: textBackgroundColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Creates a search bar with custom design

  /// Creates a title section with custom design
  static Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // Text(
          //   'View All',
          //   style: TextStyle(
          //     fontSize: 12,
          //     color: Colors.red[800],
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
        ],
      ),
    );
  }

  /// Creates the category grid with multiple category containers
  static Widget buildCategoryGrid(BuildContext context) {
    // Sample data for categories
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'FRESH & HELTHY CHICKEN',
        'images': [
          'assets/icons/3.png',
          'assets/icons/4.png',
          'assets/icons/2.png',
          'assets/icons/8.png',
          'assets/icons/7.png',
          'assets/icons/8.png',
        ],
        'backgroundColor': Colors.white,
        'textBackgroundColor': Colors.black87,
      },
      {
        'name': 'FRESH & HELTHY SEAFOOD',
        'images': [
          'assets/icons/2.png',
          'assets/icons/3.png',
          'assets/icons/4.png',
          'assets/icons/7.png',
          'assets/icons/7.png',
          'assets/icons/8.png',
        ],
        'backgroundColor': Colors.white,
        'textBackgroundColor': Colors.black87,
      },
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return categoryContainer(
          categoryName: categories[index]['name'],
          imagePaths: categories[index]['images'],
          backgroundColor: categories[index]['backgroundColor'],
          textBackgroundColor: categories[index]['textBackgroundColor'],
          onTap: () {
            // Navigate to category page or show more details
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${categories[index]['name']} selected'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        );
      },
    );
  }
}
