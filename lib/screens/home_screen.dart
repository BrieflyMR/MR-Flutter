import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 205),
      // AppBar
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 220, 220),
        title: const Text('Partyverse'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.app),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer Header
            Container(
              height: 200,
              //color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Color.fromARGB(255, 0, 180, 180),
                  ),
                  const SizedBox(height: 10),
                  
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Home Page'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.profile_circled),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.bell),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Ana içerik
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: DotLottieLoader.fromAsset("assets/motions/shopping.lottie",
                      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  }),
              ),
            ),
          ),
        ],
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: Container(height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
      IconButton(
        onPressed: () {}, 
        icon: 
        Icon(CupertinoIcons.home,
              ),
            ),
      IconButton(
        onPressed: () {}, 
        icon: 
        Icon(CupertinoIcons.search,
              ),
            ),
      IconButton(
        onPressed: () {}, 
        icon: 
        Icon(CupertinoIcons.shopping_cart,
              ),
            ),
      IconButton(
        onPressed: () {}, 
        icon: 
        Icon(Icons.celebration,
              ),
            ),
      IconButton(
        onPressed: () {}, 
        icon: 
        Icon(CupertinoIcons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}