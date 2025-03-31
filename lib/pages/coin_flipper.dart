import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:coin_tosser/pages/about_us.dart';
import 'package:coin_tosser/widgets/body_decoration.dart';
// import 'package:coin_tosser/widgets/app_responsive.dart';
import 'package:coin_tosser/widgets/button_widgets.dart';
import 'package:coin_tosser/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinFlipper extends StatefulWidget {
  const CoinFlipper({super.key});

  @override
  State<CoinFlipper> createState() => _CoinFlipperState();
}

class _CoinFlipperState extends State<CoinFlipper>
    with SingleTickerProviderStateMixin {
  String coinImg = "assets/images/1.png";
  String coinName = "Flip the Coin!";
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _bounceAnimation;
  final Random randomizer = Random();
  int headCounts = 0;
  int tailCounts = 0;
  final AudioPlayer audioPlayer = AudioPlayer();
  bool _isDarkMode = true;

  final List<String> headsNames = [
    "Lucky Heads",
    "Golden Heads",
    "Shiny Heads",
    "Power Heads",
  ];
  final List<String> tailsNames = [
    "Mighty Tails",
    "Silver Tails",
    "Fortune Tails",
    "Royal Tails",
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6), // 6-second roll for realism
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: pi * 12,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _bounceAnimation = Tween<double>(
      begin: 0,
      end: -80,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    // void playSound(String fileName) async {
    //   await audioPlayer.play(AssetSource(fileName));
    // }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          var imgNum = randomizer.nextInt(2) + 1;
          coinImg = "assets/images/$imgNum.png";
          if (imgNum == 1) {
            coinName = headsNames[randomizer.nextInt(headsNames.length)];
            headCounts++;
            playSound("sounds/heads.mp3");
          } else {
            coinName = tailsNames[randomizer.nextInt(tailsNames.length)];
            tailCounts++;
            playSound("sounds/tails.mp3");
          }

          // }
          // coinName = imgNum == 1
          //     ? headsNames[randomizer.nextInt(headsNames.length)]
          //     : tailsNames[randomizer.nextInt(tailsNames.length)];
        });
        _controller.reset();
      }
    });
  }

  void flip() {
    setState(() {
      coinName = "Flipping...";
    });
    playSound("sounds/flip.wav");

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    audioPlayer.dispose();

    super.dispose();
  }

  void playSound(String fileName) async {
    await audioPlayer.play(AssetSource(fileName));
  }

  void resetStats() {
    setState(() {
      headCounts = 0;
      tailCounts = 0;
    });
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: _isDarkMode ? Colors.grey[900] : Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Coin Tosser',
                        style: GoogleFonts.poppins(
                          color: _isDarkMode ? Colors.white : Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Flip the coin. You can flip the coin and see the amazing animations and results.',
                        style: GoogleFonts.poppins(
                          color: _isDarkMode ? Colors.grey[400] : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.home,
                  title: 'Home',
                  isDarkMode: _isDarkMode,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                _buildDrawerItem(
                  icon: _isDarkMode? Icons.light_mode: Icons.dark_mode,
                  title: _isDarkMode? 'Light Mode':"Dark Mode",
                  isDarkMode: _isDarkMode,
                  onTap: () {
                    setState(() {
                      _isDarkMode = !_isDarkMode;
                    });
                    // Navigator.of(context).pop();
                  },
                ),
                Divider(color: Colors.grey[800]),
                _buildDrawerItem(
                  icon: Icons.info,
                  title: 'About Us',
                  isDarkMode: _isDarkMode,
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => AboutUs()));
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.feedback,
                  title: 'Feedback',
                  isDarkMode: _isDarkMode,
                ),
                _buildDrawerItem(
                    icon: Icons.privacy_tip,
                    title: 'Privacy Policy',
                    isDarkMode: _isDarkMode),
                _buildDrawerItem(
                  icon: Icons.warning,
                  title: 'Disclaimer',
                  isDarkMode: _isDarkMode,
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Text(
                        '© 2024 SMAIT Technology.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        ' All rights reserved.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          color: Colors.grey[600],
                          fontSize: 12,
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
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    void Function()? onTap,
    bool isDarkMode = true,
  }) {
    return ListTile(
      leading: Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
      title: Text(
        title,
        style: GoogleFonts.poppins(
            color: isDarkMode ? Colors.white : Colors.black),
      ),
      onTap: () {
        // Handle drawer item tap
        onTap!();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _isDarkMode ? Colors.black : Colors.blueAccent.shade100, // Modern dark theme
      appBar: AppBar(
        title: Text(
          "Coin Flipper",
          style: GoogleFonts.poppins(
              color: _isDarkMode ? Colors.white : Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu,
                    color: _isDarkMode ? Colors.white : Colors.black))),
      ),
      drawer: _buildDrawer(),
      body: Center(
        child: Container(
          decoration: bodyDecoration(
            isDarkMode: _isDarkMode,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _bounceAnimation.value),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(_rotationAnimation.value),
                      child: Container(
                        child: Image.asset(coinImg, height: 250),
                      ),
                    ),
                  );
                },
              )
                  .animate()
                  .fade(duration: 200.ms)
                  .shake(duration: 600.ms)
                  .then(delay: 300.ms), // Fix for glow effect

              const SizedBox(height: 30),

              // Display Random Coin Side Name with Glowing Effect
              glowCoinName(text: coinName, isDarkMode: _isDarkMode),

              const SizedBox(height: 30),

              appButton(
                context, "Flip the coin",
                func: flip,
                color: Colors.grey.shade800,
                // color: Color(0xFF8FA1B3),
              ).animate().fade(duration: 500.ms).scale(duration: 300.ms),

              Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    normalText("Heads: $headCounts", isDarkMode: _isDarkMode),
                    normalText("Tails: $tailCounts", isDarkMode: _isDarkMode),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              appButton(
                context,
                "Reset Stats",
                color: const Color.fromARGB(255, 25, 83, 117),
                func: resetStats,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
