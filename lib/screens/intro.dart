import 'package:flutter/material.dart';
import 'package:wish_pool/wish_pool.dart';

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
                  top: deviceHeight * -0.02,
                  left: deviceWidth * 0.05,
                  child: SlideTransition(
                    position: _animation,
                    child: Image.asset(
                      'assets/app_icon.png',
                      width: deviceWidth * 0.9,
                      height: deviceHeight * 0.45,
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
