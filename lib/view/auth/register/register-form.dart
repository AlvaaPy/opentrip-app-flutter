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

  // Method to build input field
  Widget _buildTextInput({
    required String label,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
    void Function()? onTap,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: inputType,
      onTap: onTap,
    );
  }

  // Method to build gender selection row
  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }

  // Method to build submit button
  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        String fullName = _fullNameController.text;
        String dob = _dobController.text;
        String gender = _gender ?? 'Belum dipilih';
        String whatsapp = _whatsappController.text;

        if (fullName.isEmpty || dob.isEmpty || gender.isEmpty || whatsapp.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Semua field harus diisi!')),
          );
          return;
        }

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
    );
  }

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

              // Full name input
              _buildTextInput(
                label: 'Nama Lengkap',
                controller: _fullNameController,
              ),
              const SizedBox(height: 16),

              // Date of birth input
              _buildTextInput(
                label: 'Tanggal Lahir',
                controller: _dobController,
                inputType: TextInputType.datetime,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
              ),
              const SizedBox(height: 16),

              // Gender selection
              _buildGenderSelection(),
              const SizedBox(height: 16),

              // WhatsApp number input
              _buildTextInput(
                label: 'Nomor WhatsApp',
                controller: _whatsappController,
                inputType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              const Text(
                'Dengan memilih Setuju dan Lanjutkan, saya menyetujui Syarat dan Ketentuan dan Kebijakan Privasi dari Permata Wisata.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),

              // Submit button
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
