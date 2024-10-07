import 'package:flutter/material.dart';
import 'package:opentripapp/view/auth/register/register-form.dart';

class RegisterOTP extends StatefulWidget {
  const RegisterOTP({super.key});

  @override
  State<RegisterOTP> createState() => _RegisterOTPState();
}

class _RegisterOTPState extends State<RegisterOTP> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            TextField(
              controller: _otpController,
              decoration: InputDecoration(
                labelText: 'Kode OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20), // Space after input

            // Submit button
            ElevatedButton(
              onPressed: () {
                // Implement OTP verification functionality here
                String otp = _otpController.text;
                print('OTP: $otp');

                // Simulate OTP verification (you should replace this with actual verification logic)
                if (otp == '123456') { // Example OTP check
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterForm()),
                  );
                } else {
                  // Show an error message if OTP is incorrect
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('OTP tidak valid!')),
                  );
                }
              },
              child: const Text('Verifikasi OTP'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Full width button
              ),
            ),
            const SizedBox(height: 20), // Space before resending prompt

            // Resend OTP prompt
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum menerima kode? '),
                TextButton(
                  onPressed: () {
                    // Implement resend OTP functionality here
                    print('Resend OTP');
                  },
                  child: const Text('Kirim Ulang'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
