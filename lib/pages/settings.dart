import 'package:coin_tosser/widgets/body_decoration.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
const Settings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
       body: Container(
        decoration: bodyDecoration(),
         child: Center(
          child: Text(
            "Settings Page", 
            style: TextStyle(
              fontSize: 20, 
              color: Colors.white),
            ),
            ),
       ),
    );
  }
}