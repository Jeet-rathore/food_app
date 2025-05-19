import 'package:flutter/material.dart';
import 'package:food_app/appconfig/assets.dart';
import 'package:food_app/widgets/homw_widgtes.dart'; // Import the new widget class

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidgets.buildHeader(Assets.Applogo),
              CommonWidgets.buildWelcomeMessage('Prasanth'),
              CommonWidgets.buildPromoBanner(() {
                // Handle order now button press
              }),

              CommonWidgets.sectionTitle('Products'),
              CommonWidgets.buildProductCategories(),
              CommonWidgets.sectionTitle('Best Sellers'),
              CommonWidgets.buildBestSellers(),
              CommonWidgets.sectionTitle('Shop by Categories'),
              CommonWidgets.buildCategoryGrid(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
