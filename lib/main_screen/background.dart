import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4B5563), 
            Color(0x804B5563), 
            Color.fromARGB(0, 40, 90, 122), 
          ],
          stops: [0.0, 0.9, 1.0],
        ),
      ),
      child: child,
    );
  }
}
