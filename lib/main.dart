import 'package:flutter/material.dart';
import 'api_service.dart';
import 'display_page.dart'; // Import the DisplayPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  bool _isPasswordHidden = true; // State to toggle password visibility

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  String? _errorMessage;

  void _handleLogin() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    try {
      final response = await _apiService.login(username, password);

      // Navigate to DisplayPage if login is successful
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisplayPage(data: response),
          ),
        );
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Login failed: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Center(
          child: Text(
            'Login Page Dummy JSON',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.deepOrange.shade200,
                child: Center(
                  child: Container(
                    width: 400,
                    height: 500,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(5, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // User Icon
                        const CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.cyan,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Login Form Heading
                        const Text(
                          "Login Form",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Username TextField
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            hintText: 'Enter Your User Name',
                            // labelText: "Username",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),
                          style: TextStyle(),
                        ),
                        const SizedBox(height: 15),

                        // Password TextField
                        TextField(
                          controller: _passwordController,
                          obscureText: _isPasswordHidden,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Password',
                            // labelText: "Password",
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Login Button
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red, // Set the background color
                              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15), // Optional padding
                            ),
                            onPressed: _handleLogin,
                            child: const Text(
                              "Login Now",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white, // Optional text color
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        Text('User ID: emilys'),
                        Text('Password: emilyspass'),

                        // Display error message
                        if (_errorMessage != null)
                          Text(
                            _errorMessage!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
