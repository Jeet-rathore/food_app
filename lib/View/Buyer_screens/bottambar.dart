import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:food_app/View/Buyer_screens/home_screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Add your screens here
  final List<Widget> _screens = [
    HomePage(),
    const Center(child: Text('Scan')),
    const Center(child: Text('Scan')),
    const Center(child: Text('Search')),
    const Center(child: Text('Profile')),
  ];

  // Nav bar item data
  final List<Map<String, dynamic>> _navItems = const [
    {'icon': Icons.home_outlined, 'label': 'Home'},
    {'icon': Icons.car_crash, 'label': 'Card'},
    {'icon': Icons.border_outer_rounded, 'label': 'order'},
    {'icon': Icons.chat, 'label': 'Chat'},
    {'icon': Icons.person_outline, 'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      extendBody: true, // Important for the curved navigation bar
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: CurvedNavigationBar(
          index: _currentIndex,
          height: 70,
          backgroundColor:
              Colors
                  .transparent, // Make it transparent to see the screen behind it
          color: const Color(
            0xFFF8B500,
          ), // Yellow color from the original design
          buttonBackgroundColor:
              Colors.transparent, // No background for the selected item
          items: List.generate(_navItems.length, (index) {
            bool isSelected = index == _currentIndex;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon with conditional circle background
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      shape: BoxShape.circle,
                      boxShadow:
                          isSelected
                              ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                              : null,
                    ),
                    child: Icon(
                      _navItems[index]['icon'],
                      color:
                          isSelected ? const Color(0xFFF8B500) : Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Label
                  Text(
                    _navItems[index]['label'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          }),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

// Example usage:
// Add this to your main.dart or another file
class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen());
  }
}
