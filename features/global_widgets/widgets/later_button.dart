import 'package:flutter/material.dart';

class LaterButtonWidget extends StatelessWidget {
  const LaterButtonWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black,
          width: 1.5,
          // borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: TextButton(

        onPressed: () => Navigator.pop(context),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,fontWeight: FontWeight.bold
          ),
        ),

      ),
    );
  }
}
