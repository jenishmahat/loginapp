import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package
import 'login_page.dart'; // Import the LoginPage to redirect after logout

import 'dashboard_page.dart'; // Import the DashboardPage
import 'transaction_page.dart'; // Import the TransactionPage
import 'budget_page.dart'; // Import the BudgetPage

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // Default index for Profile tab

  // List of pages for the BottomNavigationBar
  static List<Widget> _pages = <Widget>[
    DashboardPage(), // Dashboard Page
    TransactionPage(), // Transaction Page
    BudgetPage(), // Budget Page
    ProfilePage(), // Profile Page (current page)
  ];

  // Function to handle navigation between pages
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the selected page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  // Function to handle logout and terminate the session
  Future<void> _logout() async {
    // Clear the session data using shared_preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored preferences (like user login data)

    // Redirect to the login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginPage()), // Login page to redirect
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('User Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage:
                  AssetImage('assets/profile_image.jpg'), // Profile image
            ),
            const SizedBox(height: 16),
            const Text(
              "Test User",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "User Name",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            _buildProfileOption(Icons.account_circle, "Account", () {
              // Add functionality for Account
            }),
            _buildProfileOption(Icons.settings, "Settings", () {
              // Add functionality for Settings
            }),
            _buildProfileOption(Icons.cloud_upload, "Export Data", () {
              // Add functionality for Export Data
            }),
            _buildProfileOption(Icons.logout, "Logout", () {
              _logout(); // Call the logout function when tapped
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for floating button
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // Creates a notch for FAB
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.credit_card,
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
            const SizedBox(width: 40), // Space for the floating action button
            IconButton(
              icon: Icon(
                Icons.pie_chart,
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                _onItemTapped(2);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                _onItemTapped(3);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build profile option list items
  Widget _buildProfileOption(IconData icon, String label, Function() onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(label),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
