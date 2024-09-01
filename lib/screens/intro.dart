import 'package:flutter/material.dart';
import 'package:wish_pool/wish_pool.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = '/intro';
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
    lowerBound: 0.6,
    upperBound: 1.0,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/intro_screen_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
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
            ScaleTransition(
              scale: _animation,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(10),
                  shape: WidgetStateProperty.all(const RoundedRectangleBorder(
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
                  Navigator.of(context)
                      .pushReplacementNamed(WishPool.routeName);
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
