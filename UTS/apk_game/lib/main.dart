import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// =======================
// MODEL CLASS
// =======================
class Game {
  final String title;
  final String shortDesc;
  final String fullDesc;
  final String image;

  Game({
    required this.title,
    required this.shortDesc,
    required this.fullDesc,
    required this.image,
  });
}

// =======================
// DATA (10 GAME) - PATH SUDAH DIPERBAIKI
// =======================
List<Game> gameList = [
  Game(
    title: "Mobile Legends",
    shortDesc: "Game MOBA populer",
    fullDesc:
        "Mobile Legends adalah game MOBA 5v5 yang dirilis tahun 2016.",
    image: "assets/mobile_legends.jpeg",  // ✅ diubah
  ),
  Game(
    title: "PUBG Mobile",
    shortDesc: "Battle royale survival",
    fullDesc:
        "PUBG Mobile adalah game battle royale dengan 100 pemain.",
    image: "assets/pugb_mobile.jpg",  // ✅ diubah
  ),
  Game(
    title: "Free Fire",
    shortDesc: "Survival shooter ringan",
    fullDesc:
        "Free Fire adalah game battle royale ringan dengan durasi cepat.",
    image: "assets/free_fire.jpeg",  // ✅ diubah
  ),
  Game(
    title: "Genshin Impact",
    shortDesc: "Open world RPG",
    fullDesc:
        "Genshin Impact adalah game RPG dunia terbuka dengan grafis tinggi.",
    image: "assets/gensin_impect.jpeg",  // ✅ diubah (perbaiki typo)
  ),
  Game(
    title: "Call of Duty Mobile",
    shortDesc: "FPS multiplayer",
    fullDesc:
        "COD Mobile menghadirkan pengalaman FPS klasik di mobile.",
    image: "assets/call_mobile.jpeg",  // ✅ diubah
  ),

  Game(
    title: "Clash of Clans",
    shortDesc: "Strategi membangun desa",
    fullDesc:
        "Bangun desa, latih pasukan, dan serang pemain lain.",
    image: "assets/COC.jpeg",  // ✅ diubah
  ),
  Game(
    title: "Among Us",
    shortDesc: "Game deduksi sosial",
    fullDesc:
        "Cari impostor di antara kru dalam permainan multiplayer.",
    image: "assets/among_us.jpeg",  // ✅ diubah
  ),
  Game(
    title: "Subway Surfers",
    shortDesc: "Endless runner",
    fullDesc:
        "Berlari tanpa akhir sambil menghindari rintangan.",
    image: "assets/SUBWAY_SURFERS.jpeg",  // ✅ diubah
  ),
  Game(
    title: "Minecraft",
    shortDesc: "Sandbox kreatif",
    fullDesc:
        "Bangun dunia sendiri dengan blok tanpa batas.",
    image: "assets/MINECRAFT.jpeg",  // ✅ diubah
  ),
  Game(
    title: "Asphalt 9",
    shortDesc: "Game balap mobil",
    fullDesc:
        "Balapan cepat dengan grafis tinggi dan mobil mewah.",
    image: "assets/ASPHALT.jpeg",  // ✅ diubah
  ),
];

// =======================
// APP
// =======================
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Game App",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}

// =======================
// HOME PAGE
// =======================
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Populer"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: gameList.length,
        itemBuilder: (context, index) {
          final game = gameList[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(game: game),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(15),
                    ),
                    child: Image.asset(
                      game.image,
                      width: 110,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 110,
                          height: 100,
                          color: Colors.grey,
                          child: Icon(Icons.error, color: Colors.red),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            game.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            game.shortDesc,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                  SizedBox(width: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// =======================
// DETAIL PAGE
// =======================
class DetailPage extends StatelessWidget {
  final Game game;

  DetailPage({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    game.image,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 250,
                        color: Colors.grey,
                        child: Icon(Icons.error, size: 50, color: Colors.red),
                      );
                    },
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        SizedBox(width: 5),
                        Text("4.8 Rating"),
                      ],
                    ),

                    SizedBox(height: 15),

                    Text(
                      game.fullDesc,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Download"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )
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