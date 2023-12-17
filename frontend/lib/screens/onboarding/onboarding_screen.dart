import 'package:flutter/material.dart';
import 'package:kakan_app/kakan_logo_icons.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:frontend/screens/home/home_screen.dart';
import 'package:frontend/screens/splash/splash_page.dart';
import 'package:frontend/screens/onboarding/get_started.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final List<OnboardingItem> onboardingScreens = [
    OnboardingItem(destinationBuilder: () => PersonalMenu()),
    OnboardingItem(destinationBuilder: () => Discover()),
    OnboardingItem(destinationBuilder: () => QuickShuffle())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingSlider(
        items: onboardingScreens
            .map((item) => OnboardingScreenWidget(item: item))
            .toList(),
        slidePercent: 70,
        enableIndicator: true,
        indicatorSelectedColor: Colors.orange,
        indicatorUnselectedColor: Colors.grey,
        onFinished: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
      ),
    );
  }

  OnboardingSlider(
      {required List<OnboardingScreenWidget> items,
      required int slidePercent,
      required bool enableIndicator,
      required MaterialColor indicatorSelectedColor,
      required MaterialColor indicatorUnselectedColor,
      required Null Function() onFinished}) {}
}

class OnboardingScreenWidget extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingScreenWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => item.destinationBuilder(),
          ),
        );
      },
    );
  }
}

class OnboardingItem {
  final Widget Function() destinationBuilder;

  OnboardingItem({
    required this.destinationBuilder,
  });
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
            image: AssetImage('assets/images/PersonalMenu.png'),
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
            image: AssetImage('assets/images/Discover.png'),
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
            image: AssetImage('assets/images/QuickShuffle.png'),
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
