import 'package:intl/intl.dart'; // Add this import to use DateFormat
import 'package:flutter/material.dart';
import 'income_page.dart'; // Import the Income page
import 'expenses_page.dart'; // Import the Expenses page
import 'notifications_page.dart'; // Import the Notifications page
import 'transaction_page.dart'; // Import your transaction page
import 'profile_page.dart'; // Assuming you have a Profile screen
import 'budget_page.dart'; // Assuming you have a Budget screen

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DateTime _selectedDate = DateTime.now();

  // This method opens a date picker dialog and sets the selected date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate, // Current date as default
      firstDate: DateTime(2010), // Start date
      lastDate: DateTime(2030), // End date
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked; // Update the selected date
      });
    }
  }

  // Handle navigation when a BottomNavigationBar item is tapped
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BudgetPage()),
        );
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
      backgroundColor: Colors.grey[100], // Light background
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Dashboard"),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(
                'assets/profile_image.jpg'), // Path to the profile image
          ),
        ),
        actions: [
          // Dropdown button that opens a date picker when clicked
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              _selectDate(context); // Call the date picker method
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to the Notifications page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: DashboardPageContent(), // Dashboard page content stays here
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define what the button should do, e.g., adding a new transaction
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Required when adding a FAB
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Always 0 for the dashboard
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped, // Handle tab taps
      ),
    );
  }
}

// Separate Widget for the Dashboard Page Content
class DashboardPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the selected date on the UI
            Text(
              "Selected Date: ${DateFormat.yMMMd().format(DateTime.now())}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Balance Section
            Text("Your Balance",
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            SizedBox(height: 10),
            Text("\$5500",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            // Income and Expense Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Income Box
                GestureDetector(
                  onTap: () {
                    // Navigate to the Income page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IncomePage()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.arrow_downward, color: Colors.green),
                        Text("Income", style: TextStyle(color: Colors.green)),
                        Text("\$2200",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                // Expenses Box
                GestureDetector(
                  onTap: () {
                    // Navigate to the Expenses page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExpensesPage()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.arrow_upward, color: Colors.red),
                        Text("Expenses", style: TextStyle(color: Colors.red)),
                        Text("\$600",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Expense Chart Section (Placeholder)
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Center(child: Text("Expense Chart Placeholder")),
            ),
            SizedBox(height: 20),
            // Recent Transactions Section
            Text("Recent Transactions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Icon(Icons.shopping_bag, color: Colors.white),
                  ),
                  title: Text("Shopping"),
                  subtitle: Text("ABC Merchant - 10:00 AM"),
                  trailing: Text("- \$105",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.restaurant, color: Colors.white),
                  ),
                  title: Text("Food"),
                  subtitle: Text("Dumpling - 07:30 PM"),
                  trailing: Text("- \$48",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
