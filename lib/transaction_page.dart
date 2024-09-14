import 'package:flutter/material.dart';
import 'budget_page.dart';
import 'dashboard_page.dart';
import 'profile_page.dart';
import 'financial_report_page.dart'; // Import the financial report page

class Transaction {
  final String title;
  final String subtitle;
  final String time;
  final String amount;
  final Color color;
  final Color amountColor;
  final IconData icon;

  Transaction({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.amount,
    required this.color,
    required this.amountColor,
    required this.icon,
  });
}

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int _selectedIndex = 1; // Default index for Transactions tab
  String _selectedPeriod = 'Month'; // Default period filter

  // Example transaction data
  List<Transaction> transactions = [
    Transaction(
      title: 'Shopping',
      subtitle: 'ABC Merchant',
      time: '10:00 AM',
      amount: '- \$105',
      color: Colors.yellow,
      amountColor: Colors.red,
      icon: Icons.shopping_bag,
    ),
    Transaction(
      title: 'Food',
      subtitle: 'Dumpling',
      time: '07:30 PM',
      amount: '- \$48',
      color: Colors.red,
      amountColor: Colors.red,
      icon: Icons.restaurant,
    ),
    Transaction(
      title: 'Salary',
      subtitle: 'Salary for April',
      time: '04:30 AM',
      amount: '+ \$3000',
      color: Colors.green,
      amountColor: Colors.green,
      icon: Icons.attach_money,
    ),
    Transaction(
      title: 'Fuel',
      subtitle: 'XYZ Gas Station',
      time: '09:30 AM',
      amount: '- \$90',
      color: Colors.blue,
      amountColor: Colors.red,
      icon: Icons.local_gas_station,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
        break;
      case 1:
        // Already on Transaction page
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

  // Handle adding new transaction
  void _addTransaction(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  // Handle filtering transactions by time period
  void _filterTransactions(String period) {
    // Logic to filter transactions by period (Day, Week, Month, Year)
    setState(() {
      _selectedPeriod = period;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Add filter functionality
            },
          ),
        ],
      ),
      body: TransactionPageContent(
        transactions: transactions,
        selectedPeriod: _selectedPeriod,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add transaction screen or show modal to add transaction
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
              _onItemTapped(1); // Already on this page
            },
          ),
          const SizedBox(width: 40),
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
    );
  }
}

class TransactionPageContent extends StatelessWidget {
  final List<Transaction> transactions;
  final String selectedPeriod;

  const TransactionPageContent({
    Key? key,
    required this.transactions,
    required this.selectedPeriod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownAndReport(context),
            const SizedBox(height: 20),
            _buildTransactionSection('Transactions', transactions),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownAndReport(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton<String>(
          value: selectedPeriod,
          items: <String>['Day', 'Week', 'Month', 'Year'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Trigger filter logic
          },
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Navigate to Financial Report Page
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FinancialReportPage()),
            );
          },
          icon: const Icon(Icons.file_copy_outlined),
          label: const Text('See your financial report'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple[100],
            foregroundColor: Colors.purple,
            minimumSize: const Size(200, 40),
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionSection(
      String title, List<Transaction> transactions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          children: transactions.map((tx) {
            return _buildTransactionItem(tx);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(Transaction transaction) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: transaction.color,
          child: Icon(transaction.icon, color: Colors.white),
        ),
        title: Text(transaction.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(transaction.subtitle),
            Text(transaction.time),
          ],
        ),
        trailing: Text(
          transaction.amount,
          style: TextStyle(
            color: transaction.amountColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
