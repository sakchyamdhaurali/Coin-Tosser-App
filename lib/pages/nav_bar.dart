// import 'package:flutter/material.dart';

// class NavBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) changeIndex;

//   const NavBar(
//       {Key? key, required this.selectedIndex, required this.changeIndex})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       selectedFontSize: 14,
//       elevation: 10,
//       backgroundColor: Colors.grey.shade900,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.white54,
//       iconSize: 25,
//       onTap: changeIndex,
//       currentIndex: selectedIndex,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.home,
//           ),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.settings),
//           label: "Settings",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: "Profile",
//         ),
//       ],
//     );
//   }
// }
