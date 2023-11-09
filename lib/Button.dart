import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key, required this.text, this.color, this.textColor, this.onTapped})
      : super(key: key);
  final String text;
  final color;
  final textColor;
  final onTapped;
  @override
  Widget build(BuildContext context) {
    return 
    
    TextButton(
      onPressed: onTapped,
      child:  ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
                child: Text(
              text,
              style: TextStyle(color: textColor),
            )),
          ),
        ),
      
    );
  }
}
