import 'package:flutter/material.dart';
import 'package:opentripapp/view/main/home/home.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  String? _gender; // To store selected gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tambahkan Informasimu!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Input field for full name
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16), // Space between fields

              // Input field for date of birth
              TextField(
                controller: _dobController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Lahir',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                onTap: () async {
                  // Show date picker when the field is tapped
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    _dobController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Format date
                  }
                },
              ),
              const SizedBox(height: 16), // Space between fields

              // Gender selection
              const Text('Jenis Kelamin'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Laki-laki',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      const Text('Laki-laki'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Perempuan',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      const Text('Perempuan'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16), // Space between fields

              // Input field for WhatsApp number
              TextField(
                controller: _whatsappController,
                decoration: const InputDecoration(
                  labelText: 'Nomor WhatsApp',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20), // Space before agreement text

              // Agreement text
              const Text(
                'Dengan memilih Setuju dan Lanjutkan, saya menyetujui Syarat dan Ketentuan dan Kebijakan Privasi dari Permata Wisata.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20), // Space before button

              // Agree and continue button
              ElevatedButton(
                onPressed: () {
                  // Handle the registration process
                  String fullName = _fullNameController.text;
                  String dob = _dobController.text;
                  String gender = _gender ?? 'Belum dipilih'; // Default if not selected
                  String whatsapp = _whatsappController.text;

                  print('Full Name: $fullName');
                  print('Date of Birth: $dob');
                  print('Gender: $gender');
                  print('WhatsApp: $whatsapp');

                 // Navigate to the Home screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                child: const Text('Setuju dan Lanjutkan'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Full width button
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
