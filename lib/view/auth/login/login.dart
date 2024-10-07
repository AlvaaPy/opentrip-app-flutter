import 'package:flutter/material.dart';
import 'package:opentripapp/view/auth/register/register.dart';

import '../../main/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Gambar di bagian atas
            Image.asset(
              "assets/img/loginassets.png",
              fit: BoxFit.cover,
              height: 365,
              width: double.infinity,
            ),
            const SizedBox(height: 10),

            // Gambar logo di bawah gambar utama
            Image.asset(
              "assets/img/logo.png",
              height: 100,
            ),

            const SizedBox(height: 20),
            const Text(
              'Siap untuk liburan tak terlupakan? Masuk dan biarkan kami bantu mewujudkannya!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20), // Space after the text

            // Input fields for email and password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10), // Space between fields
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20), // Space after inputs

            // Row for buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google login button with icon
                ElevatedButton(
                  onPressed: () {
                    // Add your Google login functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                    backgroundColor: const Color(0xFFD30000),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 8), // Space between icon and text
                      Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16), // Space between buttons
                // Login button
                ElevatedButton(
                  onPressed: () {
                    // Add your login functionality here
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    // Print email and password (for testing purposes)
                    print('Email: $email, Password: $password');

                    // Navigate to the Home screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 50), // Minimum button size
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20), // Space before registration text

            // Registration text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum punya akun? '),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: const Text('Daftar Sekarang!'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
