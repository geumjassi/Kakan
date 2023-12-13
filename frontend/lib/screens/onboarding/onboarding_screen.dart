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
            image: AssetImage('assets/Background.png'),
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

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PersonalMenu(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Introduction.png'),
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

class PersonalMenu extends StatelessWidget {
  const PersonalMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Discover()),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/PersonalMenu.png'),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        child: Align(
          alignment: const FractionalOffset(0.5, 0.39),
          child: SizedBox(
            width: 275,
            height: 110,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Offset for the shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Menu',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'You can manually add meals not found\non the app to create a personal menu\nof your underrated favorites.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 6,
                            color: Color(0xFFFF9F0E),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.circle,
                            size: 3,
                            color: Color(0xFFFF9F0E),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.circle,
                            size: 3,
                            color: Color(0xFFFF9F0E),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    bottom: 15,
                    right: 10,
                    child: Container(
                      width: 30, // Adjust according to the icon size
                      height: 30, // Adjust according to the icon size
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFF9F0E).withOpacity(0.3),
                            spreadRadius: 1,
                            offset: Offset(0, 1), // Offset for the shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color(0xFFFF9F0E),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Discover extends StatelessWidget {
  const Discover({Key? key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuickShuffle()),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Discover.png'),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        child: Align(
          alignment: const FractionalOffset(0.5, 0.73),
          child: SizedBox(
            width: 275,
            height: 110,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Discover',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Restaurants near you will be recommended\nbut you can always search for restaurants\nyou already have in mind.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 48, 48, 48),
                          decoration: TextDecoration.none,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 3,
                            color: Color(0xFFFF9F0E),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.circle,
                            size: 6,
                            color: Color(0xFFFF9F0E),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.circle,
                            size: 3,
                            color: Color(0xFFFF9F0E),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    bottom: 10,
                    right: 0,
                    child: Container(
                      width: 30, // Adjust according to the icon size
                      height: 30, // Adjust according to the icon size
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF9F0E).withOpacity(0.3),
                            spreadRadius: 1,
                            offset: const Offset(0, 0), // Offset for the shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color(0xFFFF9F0E),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuickShuffle extends StatelessWidget {
  const QuickShuffle({Key? key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SplashPage()),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/QuickShuffle.png'),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        child: Align(
          alignment: const FractionalOffset(0.5, 0.52),
          child: SizedBox(
            width: 275,
            height: 110,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Shuffle',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'If you cannot decide on what to eat, a shuffle\nbutton is always ready to give you a random\nmeal you like nearby.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 48, 48, 48),
                          decoration: TextDecoration.none,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 3,
                            color: Color(0xFFFF9F0E),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.circle,
                            size: 3,
                            color: Color(0xFFFF9F0E),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.circle,
                            size: 6,
                            color: Color(0xFFFF9F0E),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    bottom: 10,
                    right: 0,
                    child: Container(
                      width: 30, // Adjust according to the icon size
                      height: 30, // Adjust according to the icon size
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFF9F0E).withOpacity(0.3),
                            spreadRadius: 1,
                            offset: Offset(0, 0), // Offset for the shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color(0xFFFF9F0E),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
