import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laugh1/screens/onboarding/onboarding.dart';
import 'package:laugh1/screens/onboarding/onboarding.dart';
import 'package:laugh1/screens/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAuth = false;

  @override
  void initState() {
    var d = const Duration(milliseconds: 2000);
    // delayed 3 seconds to next page
    Future.delayed(d, () {
      // to next page and close this page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            body: OnBoardingPage(),
          ),
        ),
        (route) => false,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.10,
            child: Container(
                child: Image.asset(
              "assets/images/doodle.png",
              fit: BoxFit.cover,
              height: defHeight,
              width: defWidth,
            )),
          ),
          Positioned(
              top: 25,
              left: 200,
              child: SvgPicture.asset(
                "assets/svgs/driv.svg",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              )),
          Container(
            decoration: const BoxDecoration(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "መንጃ",
                    style: TextStyle(
                        fontFamily: "Jiret",
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 100),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your best trainer",
                    style: GoogleFonts.poppins(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w700,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.jpg",
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
