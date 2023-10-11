import 'package:flutter/material.dart';
import 'package:kakan_app/kakan_logo_icons.dart'; // Import Logo

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int count = 0;
  int bounces = 5;

  @override
  void initState() {
    super.initState();

    // Duration Controller for the bounce
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
    );

    // Bounce height
    Tween<double> positionTween = Tween(begin: -50, end: 0);

    // Create the animation
    _animation = positionTween.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Listener to know when to stop
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        count++;
        if (count < bounces) {
          _controller.reverse();
        } else {
          _controller.stop();
        }
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfffe724c), Color(0xFFFF9F0E)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          // Logo
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  child: Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: Icon(
                      KakanLogo.kakan,
                      size: 150,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
