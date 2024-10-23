import 'package:flutter/material.dart';
import 'dart:async'; // Untuk menambahkan delay

import 'package:uts_mobile_prog/views/pages/home.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay 3 detik sebelum navigasi ke HomePage
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });

    // Menggunakan MediaQuery untuk mendapatkan tinggi layar
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Row untuk menampilkan dua gambar logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  "assets/logo2.jpg",
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(
              height: 20, // Menggunakan height untuk jarak vertikal
            ),
            // Text untuk slogan
            const Text(
              'PeDe #APA² BISA',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            // Gambar tambahan di bawah
            Image.asset("assets/gambar.png",
                width: double.infinity,
                height: screenHeight / 2,
                fit: BoxFit.cover // Sesuaikan ukuran gambar
                ),
          ],
        ),
      ),
    );
  }
}
