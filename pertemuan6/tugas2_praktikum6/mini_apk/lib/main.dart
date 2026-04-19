import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manga App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// MODEL
class Manga {
  String judul;
  String gambar;
  String deskripsi;

  Manga({
    required this.judul,
    required this.gambar,
    required this.deskripsi,
  });
}


class HomePage extends StatelessWidget {
  final List<Manga> dataManga = [
    Manga(
      judul: "Goodbye eri",
      gambar: "assets/goodbye_eri.jpg",
      deskripsi: "Kisah emosional tentang kehilangan, film, dan realita.",
    ),
    Manga(
      judul: "BERSERK",
      gambar: "assets/Berserk.jpg",
      deskripsi: "Perjuangan brutal seorang pendekar melawan takdir dan kegelapan.",
    ),
    Manga(
      judul: "Tokyo ghoul",
      gambar: "assets/Tokyo_Ghoul.jpg",
      deskripsi: "Kehidupan setengah manusia setengah monster di dunia yang kejam.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Manga"),
        backgroundColor: const Color.fromARGB(255, 115, 26, 26),
      ),
      body: ListView.builder(
        itemCount: dataManga.length,
        itemBuilder: (context, index) {
          final item = dataManga[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(data: item),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // GAMBAR
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item.gambar,
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 15),

                  // TEXT
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.judul,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          item.deskripsi,
                          style: TextStyle(color: Colors.grey[300]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 115, 103, 103),
    );
  }
}


class DetailPage extends StatelessWidget {
  final Manga data;

  DetailPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.judul),
        backgroundColor: const Color.fromARGB(255, 91, 112, 113),
      ),
      backgroundColor: const Color.fromARGB(255, 89, 104, 114),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // GAMBAR BESAR
            Image.asset(
              data.gambar,
              width: double.infinity,
              height: 700,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.judul,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    data.deskripsi +
                        "\n\nIni adalah deskripsi lengkap dari manga tersebut. Cerita lebih panjang, karakter menarik, dan penuh aksi.",
                    style: TextStyle(color: Colors.grey[300]),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Kembali"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}