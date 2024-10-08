import 'package:flutter/material.dart';
import 'package:opentripapp/view/auth/register/register-form.dart';

class RegisterOTP extends StatefulWidget {
  const RegisterOTP({super.key});

  @override
  State<RegisterOTP> createState() => _RegisterOTPState();
}

class _RegisterOTPState extends State<RegisterOTP> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  // Method to build OTP input field
  Widget _buildOtpInput() {
    return TextField(
      controller: _otpController,
      decoration: InputDecoration(
        labelText: 'Kode OTP',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  // Method to build Submit button
  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _isLoading
          ? null
          : () async {
              String otp = _otpController.text;

              // Simulate loading state
              setState(() {
                _isLoading = true;
              });

              await Future.delayed(const Duration(seconds: 2)); // Simulated OTP verification delay

              // Simulate OTP verification (replace this with actual verification logic)
              if (otp == '123456') { // Example OTP check
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterForm()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('OTP tidak valid!')),
                );
              }

              setState(() {
                _isLoading = false;
              });
            },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50), // Full width button
      ),
      child: _isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : const Text('Verifikasi OTP'),
    );
  }

  // Method to build Resend OTP prompt
  Widget _buildResendOtpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Belum menerima kode? '),
        TextButton(
          onPressed: () {
            // Implement resend OTP functionality here
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('OTP telah dikirim ulang!')),
            );
            print('Resend OTP');
          },
          child: const Text('Kirim Ulang'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Masukkan Kode OTP'), // App bar title
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Kami telah mengirimkan kode OTP ke nomor Anda.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Space after the text

            // OTP input field
            _buildOtpInput(),
            const SizedBox(height: 20), // Space after input

            // Submit button
            _buildSubmitButton(),
            const SizedBox(height: 20), // Space before resending prompt

            // Resend OTP prompt
            _buildResendOtpText(),
          ],
        ),
      ),
    );
  }
}
