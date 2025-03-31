import 'package:coin_tosser/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget appButton(BuildContext context, String buttonName,
    
    {
      Color color = Colors.black,
       void Function()? func,
       Animate animate()? ,
    }
    
    ) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
        
      ),
      child: Center(
        child: normalText(buttonName),
      ),
    ),
  );
}
