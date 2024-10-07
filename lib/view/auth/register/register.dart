import 'package:flutter/material.dart';
import 'package:opentripapp/view/auth/login/login.dart';
import 'package:opentripapp/view/auth/register/register-otp.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              'Daftar sekarang dan rasakan liburan tanpa ribet!',
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
                // Google Register button with icon
                ElevatedButton(
                  onPressed: () {
                    // Add your Google Register functionality here
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
                        'Register with Google',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16), // Space between buttons
                // Register button
                ElevatedButton(
                  onPressed: () {
                    // Retrieve email and password
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    print('Email: $email, Password: $password');

                    // Navigate to the OTP page after registration
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterOTP()),
                    );
                  },
                  child: const Text('Register'),
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
                const Text('Sudah punya akun? '),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text('Login!'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
