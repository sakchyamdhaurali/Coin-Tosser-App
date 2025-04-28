import 'package:coin_tosser/widgets/body_decoration.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 86, 88),

        title: Text("About Us",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: Icon(Icons.arrow_back_ios,
          color: Colors.white,
          ),
        ),
        
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: bodyDecoration(),
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Container(
                  child: Text("Dhaurali Software",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  ),
                ),
                SizedBox(height: 15,),
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                textAlign: TextAlign.justify,
                 style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white,
                ),
                ),
            
                SizedBox(height: 15,),
            
                Text("Developed By: Sakchyam Dhaurali",
                textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10,),
            
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //      Text("Team Members:",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 24,
                  //       color: Colors.white60,
                  //     ),
                  //     ),
                  //     Text("Santosh Adhikari",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 24,
                  //       color: Colors.white60,
                  //     ),
                  //     ),
                  //      Text("Sakchyam Dhaurali",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 24,
                  //       color: Colors.white60,
                  //     ),
                  //     ),
                  //   ],
                  // ),
              ],
            ),
          ),
        ),
      )
    );
  }
}