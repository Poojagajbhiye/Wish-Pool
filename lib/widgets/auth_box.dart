import 'package:flutter/material.dart';

class AuthBox extends StatelessWidget {
  final Widget child;
  const AuthBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(25),
      height: deviceHeight * 0.55,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 1,
            color: Colors.black12,
          ),
          BoxShadow(
            offset: Offset(-2, -2),
            blurRadius: 1,
            color: Colors.black12,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFBAC2D9),
      ),
      child: child,
    );
  }
}
