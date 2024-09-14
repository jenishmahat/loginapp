import 'package:flutter/material.dart';

class FinancialReportPage extends StatelessWidget {
  const FinancialReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Report'),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text('This is the Financial Report Screen',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
