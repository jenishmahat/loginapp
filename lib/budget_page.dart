import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Import the Dashboard Page
import 'transaction_page.dart'; // Import the Transaction Page
import 'profile_page.dart'; // Import the Profile Page

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int _selectedIndex = 2; // Default index for Budget tab (index starts from 0)

  // Handle navigation based on selected index
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TransactionPage()),
        );
        break;
      case 2:
        // Already on Budget page, do nothing
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("June"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Add functionality to go to the next month if needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "You haven't made a budget schedule.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Let's create one for you.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Add functionality to schedule a budget
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Purple button background
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Schedule a budget",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define what the FAB should do, e.g., add new budget
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // Create a notch for the FAB
        notchMargin: 8.0, // Space around the FAB notch
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
            const SizedBox(width: 40), // Space for the FAB
            IconButton(
              icon: Icon(
                Icons.pie_chart,
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                _onItemTapped(2); // Stay on the Budget page
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
}
