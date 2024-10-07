import 'package:flutter/material.dart';
import 'landingpage2.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({Key? key}) : super(key: key);

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar di bagian atas
              Image.asset(
                'assets/img/landingpage1.png', // Ganti dengan path gambar Anda
                fit: BoxFit.cover,
                height: 365,
              ),
              const SizedBox(height: 20), // Jarak antara gambar dan teks

              // Padding untuk teks dan elemen lainnya
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // RichText untuk "Paket Wisata"
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Paket',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              letterSpacing: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: '   ', // Memberikan jarak dengan spasi
                          ),
                          TextSpan(
                            text: 'Wisata',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Color(0xFFD30000), // Warna merah
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: 5), // Jarak kecil untuk visual yang nyaman

                    // RichText untuk "Liburan Seru"
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Liburan',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Color(0xFFD30000), // Warna merah
                              letterSpacing: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: ' Seru',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Colors.black, // Warna hitam untuk "Seru"
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Jarak antara judul dan hashtag

                    // Hashtag
                    const Text(
                      '#LebihLokalLebihSeru',
                      style: TextStyle(
                        fontSize: 24, // Ukuran lebih kecil untuk hashtag
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: Color(0xFFD30000), // Warna merah
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Jarak antara hashtag dan deskripsi

                    // Teks deskripsi
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize:
                              18, // Ukuran font lebih kecil untuk deskripsi
                          fontWeight: FontWeight.w400,
                          letterSpacing:
                              1, // Spasi antar huruf untuk keterbacaan
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Liburan menjadi lebih ',
                          ),
                          TextSpan(
                            text: 'CEPAT, MUDAH ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD30000), // Warna merah
                            ),
                          ),
                          TextSpan(
                            text: 'dan ',
                          ),
                          TextSpan(
                            text: 'MENYENANGKAN ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD30000), // Warna merah
                            ),
                          ),
                          TextSpan(
                            text: 'bersama Permata Wisata.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: 170), 

                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFFD30000), // Warna background tombol
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 16), // Padding dalam tombol
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Sudut tombol yang melengkung
                          ),
                        ),
                        onPressed: () {
                          // Aksi navigasi ke Landingpage2
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Landingpage2(),
                            ),
                          );
                        },
                        child: const Text('Next', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          color: Colors.white, // Warna hitam
                        ),),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Indikator Slide
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Aktif (Halaman 1)
                          Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: Colors.red, // Warna aktif
                              shape: BoxShape.circle,
                            ),
                          ),
                          // Tidak Aktif (Halaman 2)
                          Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey, // Warna tidak aktif
                              shape: BoxShape.circle,
                            ),
                          ),
                          // Tidak Aktif (Halaman 3)
                          Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey, // Warna tidak aktif
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
