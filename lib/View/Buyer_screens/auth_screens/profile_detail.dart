import 'package:flutter/material.dart';
import 'package:food_app/Them/colour.dart';
import 'package:food_app/widgets/profile_detail.dart';
import 'package:go_router/go_router.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  String? selectedState;
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    final halfWidth = MediaQuery.of(context).size.width / 2 - 24;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Profile Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Updated "My Profile" row with Edit button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add your edit logic here
                      print('Edit tapped');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(
                          0.15,
                        ), // light blue background
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 16, color: Colors.blue[700]),
                          const SizedBox(width: 4),
                          Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue[700],
                              decorationThickness: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  SizedBox(
                    width: halfWidth,
                    child: CommonWidgets.buildLabeledTextField(
                      label: 'First Name',
                      icon: Icons.person,
                      hintText: 'Enter first name',
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: halfWidth,
                    child: CommonWidgets.buildLabeledTextField(
                      label: 'Last Name',
                      icon: Icons.person_outline,
                      hintText: 'Enter last name',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CommonWidgets.buildLabeledTextField(
                label: 'User ID',
                icon: Icons.email,
                hintText: 'Enter your email ID',
              ),
              const SizedBox(height: 20),
              CommonWidgets.buildLabeledTextField(
                label: 'Office Contact Number',
                icon: Icons.phone,
                hintText: 'Enter your office contact number',
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CommonWidgets.buildLabeledTextField(
                      label: 'Password',
                      icon: Icons.lock,
                      hintText: 'Enter your password',
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CommonWidgets.buildLabeledTextField(
                      label: 'Confirm Password',
                      icon: Icons.lock_outline,
                      hintText: 'Re-enter your password',
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CommonWidgets.buildLabeledTextField(
                label: 'Driving License',
                icon: Icons.drive_eta,
                hintText: 'Enter your driving license number',
              ),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: halfWidth,
                  child: CommonWidgets.buildDropdown(
                    label: 'State',
                    icon: Icons.location_city,
                    value: selectedState,
                    items: ['State 1', 'State 2', 'State 3', 'State 4'],
                    onChanged: (val) {
                      setState(() {
                        selectedState = val;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: halfWidth,
                  child: CommonWidgets.buildDropdown(
                    label: 'City',
                    icon: Icons.location_on,
                    value: selectedCity,
                    items: ['City 1', 'City 2', 'City 3', 'City 4'],
                    onChanged: (val) {
                      setState(() {
                        selectedCity = val;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CommonWidgets.buildLabeledTextField(
                label: 'Pin Code',
                icon: Icons.pin_drop,
                hintText: 'Enter your pin code',
              ),
              const SizedBox(height: 20),
              CommonWidgets.buildLabeledTextField(
                label: 'Security Pin',
                icon: Icons.security,
                hintText: 'Enter your security pin',
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/Home_Page');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    // Save for later logic
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.darkYellow),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Complete Registration Later',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
