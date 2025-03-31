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
                  child: Text("Top IT Solutions Backed by 10 Years of Experience — SMAIT Software Partnership",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  ),
                ),
                SizedBox(height: 15,),
                Text("We specialize in software development, including mobile apps and web solutions. We cater to startups, SMBs, and enterprises with bespoke native and cross-platform solutions designed to fuel their growth. Our expert mobile app developers stay ahead of market trends to innovate and craft apps that enhance engagement and modernity. Our solutions are tailored to meet industry-specific needs, helping businesses achieve their desired user retention rates.",
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
            
                
              ],
            ),
          ),
        ),
      )
    );
  }
}