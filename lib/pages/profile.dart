import 'package:coin_tosser/widgets/body_decoration.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
     return Scaffold(
       body: Container(
        decoration: bodyDecoration(),
         child: Center(
          child: Text(
            "Profile Page", 
            style: TextStyle(
              fontSize: 20, 
              color: Colors.white),
            ),
            ),
       ),
    );
  }
}