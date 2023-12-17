import 'package:flutter/material.dart';
import 'package:kakan_app/kakan_logo_icons.dart';
import 'package:kakan_app/screens/splash/splash_page.dart';

class OnboardingScreenFirst extends StatelessWidget {
  const OnboardingScreenFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 400));

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const GetStarted(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  bool _showIcon = false;
  bool _isTapped = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        _showIcon = true;
      });
    });
  }

  void _handleTap() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Introduction.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          bottom: _showIcon ? 320 : -200,
          left: 0,
          right: 0,
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: Icon(
              KakanLogo.kakan,
              color: Colors.white,
              size: 250,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: GestureDetector(
              onTap: _handleTap,
              onTapDown: (_) {
                setState(() {
                  _isTapped = true;
                });
              },
              onTapUp: (_) {
                setState(() {
                  _isTapped = true;
                });
              },
              onTapCancel: () {
                setState(() {
                  _isTapped = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _isTapped
                      ? Color(0xFFFF9F0E).withOpacity(0.3)
                      : const Color.fromARGB(255, 254, 254, 255),
                ),
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFFFF9F0E),
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
