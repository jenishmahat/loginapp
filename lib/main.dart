import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'dashboard_page.dart';
import 'transaction_page.dart';
import 'budget_page.dart';
import 'profile_page.dart';

void main() {
  runApp(SaveSmartApp());
}

class SaveSmartApp extends StatelessWidget {
  const SaveSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Define initial route and named routes
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/dashboard': (context) => DashboardPage(),
        '/transaction': (context) => TransactionPage(),
        '/budget': (context) => BudgetPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100], // Light green background
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center everything vertically
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center everything horizontally
          children: [
            const Icon(
              Icons.savings, // Piggy bank icon to represent savings
              size: 100.0,
              color: Colors.green, // Green color for the piggy bank
            ),
            const SizedBox(
                height: 20), // Add space between the icon and the title
            const Text(
              "SAVE SMART", // Title of your app
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40), // Space between title and buttons
            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/login'); // Navigate to Login page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.lightBlue, // Light blue button background
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              child: const Text(
                "Login",
                style:
                    TextStyle(fontSize: 18, color: Colors.white), // White font
              ),
            ),
            const SizedBox(height: 20), // Space between buttons
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/signup'); // Navigate to Sign Up page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.lightBlue, // Light blue button background
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              child: const Text(
                "Sign Up",
                style:
                    TextStyle(fontSize: 18, color: Colors.white), // White font
              ),
            ),
          ],
        ),
      ),
    );
  }
}
