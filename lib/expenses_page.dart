import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  String? _selectedCategory;
  DateTime _selectedDate = DateTime.now();
  TextEditingController _amountController = TextEditingController();
  String _displayExpense = '';
  double _totalExpenses = 0; // Track total expenses

  final List<String> _categories = ['Food', 'Grocery', 'Rent', 'Bills'];

  // Function to show DatePicker and select a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Function to handle 'Continue' button and display the entered expenses
  void _handleContinue() {
    double enteredAmount = double.tryParse(_amountController.text) ?? 0;

    setState(() {
      _totalExpenses += enteredAmount; // Update total expenses
      _displayExpense = 'Expense: $_selectedCategory, '
          'Amount: \$${_amountController.text}, '
          'Date: ${DateFormat.yMMMd().format(_selectedDate)}';
      _amountController.clear(); // Clear amount field after entering expense
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense'),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Expenses',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                '\$${_totalExpenses.toStringAsFixed(2)}', // Display updated total expenses
                style: const TextStyle(
                  fontSize: 48,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Dropdown for Category
              _buildCategoryDropdown(),
              const SizedBox(height: 16),
              // Date Picker for Description (renamed to Date)
              _buildDatePicker(),
              const SizedBox(height: 16),
              // Text field for Amount in dollars
              _buildAmountField(),
              _buildAttachmentSection(),
              const SizedBox(height: 20),
              // Continue Button
              ElevatedButton(
                onPressed: _handleContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  minimumSize:
                      const Size(double.infinity, 50), // Full width button
                ),
                child: const Text('Continue'),
              ),
              const SizedBox(height: 20),
              // Display entered expense
              if (_displayExpense.isNotEmpty)
                Text(
                  _displayExpense,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Dropdown menu for category selection
  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Category',
        prefixIcon: Icon(Icons.category),
        border: OutlineInputBorder(),
      ),
      value: _selectedCategory,
      items: _categories.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedCategory = newValue;
        });
      },
    );
  }

  // Date picker for the expense date
  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Date',
            prefixIcon: Icon(Icons.calendar_today),
            border: const OutlineInputBorder(),
          ),
          controller: TextEditingController(
              text: DateFormat.yMMMd().format(_selectedDate)),
        ),
      ),
    );
  }

  // Amount input field
  Widget _buildAmountField() {
    return TextFormField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Amount',
        prefixIcon: Icon(Icons.attach_money),
        border: OutlineInputBorder(),
      ),
    );
  }

  // Attachment section
  Widget _buildAttachmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text('Add attachment'),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () {
            // Handle attachment
          },
          icon: const Icon(Icons.attach_file),
          label: const Text('Attach file'),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Repeat transaction'),
            Switch(value: false, onChanged: (value) {}),
          ],
        ),
      ],
    );
  }
}
