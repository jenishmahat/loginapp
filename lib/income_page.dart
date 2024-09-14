import 'package:flutter/material.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Income'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Income',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              '\$0',
              style: TextStyle(
                fontSize: 48,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Form fields (Category, Description, Wallet, etc.)
            _buildInputField('Category', Icons.category),
            _buildInputField('Description', Icons.description),
            _buildInputField('Wallet', Icons.account_balance_wallet),
            _buildAttachmentSection(),
            const SizedBox(height: 20),
            // Continue Button
            ElevatedButton(
              onPressed: () {
                // Handle continue action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                minimumSize:
                    const Size(double.infinity, 50), // Full width button
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildAttachmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
