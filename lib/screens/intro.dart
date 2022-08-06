import 'package:flutter/material.dart';
import 'package:wish_pool/screens/auth/auth.dart';
import 'package:wish_pool/wish_pool.dart';
// import 'package:wish_pool/screens/auth/auth.dart';

// import 'package:wish_pool/screens/auth/auth.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = '/intro';
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: const Offset(0, 0.09),
  ).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final double deviceHeight = deviceSize.height;
    final double deviceWidth = deviceSize.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                const SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                ),
                Positioned(
                  top: deviceHeight * -0.05,
                  left: deviceWidth * -0.10,
                  child: Image.asset(
                    'assets/cloud.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                Positioned(
                  top: deviceHeight * 0.12,
                  left: deviceWidth * 0.10,
                  child: SlideTransition(
                    position: _animation,
                    child: Image.asset(
                      'assets/wish_pool_cloud_new.png',
                    ),
                  ),
                ),
                Positioned(
                  top: deviceHeight * 0.01,
                  right: deviceWidth * 0.08,
                  child: Image.asset(
                    'assets/cloud.png',
                    width: 95,
                    height: 95,
                  ),
                ),
                Positioned(
                  top: deviceHeight * 0.32,
                  left: deviceWidth * 0.02,
                  child: Image.asset(
                    'assets/cloud.png',
                    width: 70,
                    height: 70,
                  ),
                ),
                // Positioned(
                //   top: 10,
                //   left: 20,
                //   child: Image.asset(
                //     'assets/carrier_cloud.png',
                //     width: 360,
                //     height: 360,
                //   ),
                // ),
                // Positioned(
                //   top: 100,
                //   left: 80,
                //   child: Image.asset(
                //     'assets/wish_pool_250.png',
                //   ),
                // ),
                // Positioned(
                //   top: 120,
                //   left: 120,
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           GradientText(
                //             // 'WiSH\nP       L',
                //             'W',
                //             gradientType: GradientType.radial,
                //             style: const TextStyle(
                //               fontFamily: 'Nunito',
                //               fontSize: 50,
                //               shadows: [
                //                 Shadow(
                //                   color: Colors.black,
                //                   offset: Offset(3, -3),
                //                 ),
                //               ],
                //             ),
                //             colors: const [
                //               Color.fromARGB(255, 192, 217, 238),
                //               Color.fromARGB(255, 113, 168, 213),
                //               Color.fromARGB(255, 54, 103, 144),
                //             ],
                //           ),
                //           GradientText(
                //             // 'WiSH\nP       L',
                //             'I',
                //             gradientType: GradientType.radial,
                //             style: const TextStyle(
                //               fontFamily: 'Nunito',
                //               fontSize: 50,
                //               shadows: [
                //                 Shadow(
                //                   color: Colors.black,
                //                   offset: Offset(3, -3),
                //                 ),
                //               ],
                //             ),
                //             colors: const [
                //               Color.fromARGB(255, 192, 217, 238),
                //               Color.fromARGB(255, 113, 168, 213),
                //               Color.fromARGB(255, 54, 103, 144),
                //             ],
                //           ),
                //           GradientText(
                //             // 'WiSH\nP       L',
                //             'S',
                //             gradientType: GradientType.radial,
                //             style: const TextStyle(
                //               fontFamily: 'Nunito',
                //               fontSize: 50,
                //               shadows: [
                //                 Shadow(
                //                   color: Colors.black,
                //                   offset: Offset(3, -3),
                //                 ),
                //               ],
                //             ),
                //             colors: const [
                //               Color.fromARGB(255, 192, 217, 238),
                //               Color.fromARGB(255, 113, 168, 213),
                //               Color.fromARGB(255, 54, 103, 144),
                //             ],
                //           ),
                //           GradientText(
                //             // 'WiSH\nP       L',
                //             'H',
                //             gradientType: GradientType.radial,
                //             style: const TextStyle(
                //               fontFamily: 'Nunito',
                //               fontSize: 50,
                //               shadows: [
                //                 Shadow(
                //                   color: Colors.black,
                //                   offset: Offset(3, -3),
                //                 ),
                //               ],
                //             ),
                //             colors: const [
                //               Color.fromARGB(255, 192, 217, 238),
                //               Color.fromARGB(255, 113, 168, 213),
                //               Color.fromARGB(255, 54, 103, 144),
                //             ],
                //           ),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           GradientText(
                //             // 'WiSH\nP       L',
                //             'P',
                //             gradientType: GradientType.radial,
                //             style: const TextStyle(
                //               fontFamily: 'Nunito',
                //               fontSize: 50,
                //               shadows: [
                //                 Shadow(
                //                   color: Colors.black,
                //                   offset: Offset(3, -3),
                //                 ),
                //               ],
                //             ),
                //             colors: const [
                //               Color.fromARGB(255, 192, 217, 238),
                //               Color.fromARGB(255, 113, 168, 213),
                //               Color.fromARGB(255, 54, 103, 144),
                //             ],
                //           ),
                //           GradientText(
                //             // 'WiSH\nP       L',
                //             '       ',
                //             gradientType: GradientType.radial,
                //             style: const TextStyle(
                //               fontFamily: 'Nunito',
                //               fontSize: 50,
                //               shadows: [
                //                 Shadow(
                //                   color: Colors.black,
                //                   offset: Offset(2, -2),
                //                 ),
                //               ],
                //             ),
                //             colors: const [
                //               Color.fromARGB(255, 246, 248, 250),
                //               // Color.fromARGB(255, 71, 135, 187),
                //               Color.fromARGB(255, 54, 103, 144),
                //             ],
                //           ),
                //           GradientText(
                //             // 'WiSH\nP       L',
                //             'L',
                //             gradientType: GradientType.radial,
                //             style: const TextStyle(
                //               fontFamily: 'Nunito',
                //               fontSize: 50,
                //               shadows: [
                //                 Shadow(
                //                   color: Colors.black,
                //                   offset: Offset(3, -3),
                //                 ),
                //               ],
                //             ),
                //             colors: const [
                //               Color.fromARGB(255, 192, 217, 238),
                //               Color.fromARGB(255, 113, 168, 213),
                //               Color.fromARGB(255, 54, 103, 144),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                //   // child: Text(
                //   //   'WiSH\nP       L',
                //   //   textAlign: TextAlign.center,
                //   //   style: TextStyle(
                //   //     color: Color(0xFF59A7E8),
                //   //     fontFamily: 'Nunito',
                //   //     fontSize: 50,
                //   //   ),
                //   // ),
                // ),
                // Positioned(
                //   top: 220,
                //   left: 90,
                //   child: Image.asset(
                //     'assets/cloud1_svg.png',
                //     width: 50,
                //     height: 50,
                //   ),
                // ),
                // Positioned(
                //   top: 195,
                //   left: 155,
                //   child: Image.asset(
                //     'assets/shooting_star.png',
                //     width: 50,
                //     height: 50,
                //   ),
                // ),
                // Positioned(
                //   top: 195,
                //   right: 140,
                //   child: Image.asset(
                //     'assets/shooting_star.png',
                //     width: 50,
                //     height: 50,
                //   ),
                // ),
                // const Positioned(
                //     top: 129,
                //     left: 187,
                //     child: Icon(
                //       Icons.favorite_rounded,
                //       color: Colors.red,
                //       size: 17,
                //     )),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Make your wish!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              fontSize: 75,
              color: Color.fromARGB(255, 21, 41, 57),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 1, 85, 145)),
              elevation: MaterialStateProperty.all(10),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              )),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Start Wishing",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(WishPool.routeName);
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
