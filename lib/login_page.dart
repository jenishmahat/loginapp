import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Import the DashboardPage for navigation after login

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Dummy user credentials
  String dummyEmail = "test@example.com";
  String dummyPassword = "123456";

  // Login function to validate dummy credentials
  Future<void> _login() async {
    if (_emailController.text == dummyEmail &&
        _passwordController.text == dummyPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login successful!")));

      // Navigate to Dashboard after login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DashboardPage()), // Navigate to DashboardPage
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid credentials!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.savings, size: 100.0, color: Colors.green),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login, // Perform login check
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
