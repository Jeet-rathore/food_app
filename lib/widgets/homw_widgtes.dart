import 'package:flutter/material.dart';

class CommonWidgets {
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

  /// Creates a section title with custom design
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

  /// Creates the category grid with multiple category containers and a search button in between
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

    return Stack(
      alignment: Alignment.center,
      children: [
        // Category grid containers
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing:
                  20, // Increased spacing to make room for search button
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
          ),
        ),

        // Search button in the middle
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                // Handle search button tap
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Search tapped'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.search, size: 28, color: Colors.grey[800]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Creates a header with company name and user information
  static Widget buildHeader(String appLogo) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top part with company name
          const Text(
            'Lab2Meat',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Bottom part with profile, time, location, and icons
          Row(
            children: [
              // Profile image
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(appLogo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Time and location info in column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '15 minutes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 12,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            'Elliot Street, Currency Nagar\n jaipur rajasthan, ',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Help icon
              Container(
                width: 36,
                height: 36,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Text(
                    '?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              // Notification icon with badge
              Stack(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        'CI',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Creates a welcome message section
  static Widget buildWelcomeMessage(String userName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello $userName!',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '"Fresh meat, delivered to your doorstep\n - hassle-free!"',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  /// Creates a promotional banner
  static Widget buildPromoBanner(VoidCallback? onPressed) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main container with promotion content
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red[900],
          ),
          child: Stack(
            children: [
              // Right-side image (phone + scooter + box)
              Positioned(
                right: -10,
                bottom: 0,
                top: 0,
                child: Image.asset(
                  "assets/icons/image 3.png",
                  fit: BoxFit.contain,
                  height: 140,
                ),
              ),

              // Text and Button on the left side
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '"Premium quality meat,\nsourced fresh & delivered\nfast!"',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        minimumSize: const Size(100, 34),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Order Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Creates a horizontally scrollable product category list
  static Widget buildProductCategories() {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Chicken',
        'subtitle': 'place',
        'imagePath': 'assets/icons/5.png',
        'color': Colors.white,
      },
      {
        'title': 'Fish',
        'subtitle': 'Fresh stock',
        'imagePath': 'assets/icons/7.png',
        'color': Colors.white,
      },
      {
        'title': 'Mutton',
        'subtitle': 'All available',
        'imagePath': 'assets/icons/6.png',
        'color': Colors.white,
      },
      {
        'title': 'Marinated',
        'subtitle': 'Ready to cook',
        'imagePath': 'assets/icons/2.png',
        'color': Colors.white,
      },
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      width: 60,
                      height: 60,
                      color: categories[index]['color'],
                      child: Image.asset(
                        categories[index]['imagePath'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_not_supported,
                            size: 30,
                            color: Colors.red[800],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    categories[index]['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    categories[index]['subtitle'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Creates a horizontally scrollable best sellers list
  static Widget buildBestSellers() {
    final List<Map<String, dynamic>> bestSellers = [
      {
        'title': 'Chicken Pieces',
        'subtitle': 'Fresh & Tender',
        'imagePath': 'assets/icons/4.png',
        'color': Colors.white,
      },
      {
        'title': 'Chicken Leg',
        'subtitle': 'Juicy Cuts',
        'imagePath': 'assets/icons/3.png',
        'color': Colors.white,
      },
      {
        'title': 'Tikkas',
        'subtitle': 'Ready to Grill',
        'imagePath': 'assets/icons/2.png',
        'color': Colors.white,
      },
      {
        'title': 'Fish',
        'subtitle': 'Boneless Options',
        'imagePath': 'assets/icons/8.png',
        'color': Colors.white,
      },
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 150, // Increased to accommodate subtitle
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: bestSellers.length,
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  ClipOval(
                    child: Container(
                      width: 80,
                      height: 80,
                      color: bestSellers[index]['color'],
                      child: Image.asset(
                        bestSellers[index]['imagePath'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: Colors.red[800],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    bestSellers[index]['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    bestSellers[index]['subtitle'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 11, color: Colors.black54),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Creates a custom search bar with rounded corners
}
