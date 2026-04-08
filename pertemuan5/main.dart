import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 05',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Pendidikan'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school, size: 80, color: Colors.green),

              SizedBox(height: 30),
              // 🔽 JUDUL
              Text(
                'Selamat Datang di Aplikasi Belajar',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 15),

              // 🔽 DESKRIPSI
              Text(
                'Aplikasi ini membantu Anda belajar Flutter dengan mudah dan menyenangkan.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 25),

              Text(
                'Semangat Belajar 🚀',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
