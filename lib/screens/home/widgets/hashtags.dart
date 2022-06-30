import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laugh1/screens/constants/constants.dart';

class HashTags extends StatelessWidget {
  const HashTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.brown.withOpacity(0.2),
          ),
          child: Center(
            child: Text(
              "#joke",
              style: GoogleFonts.poppins(fontSize: 10.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Container(
          height: 25.0,
          width: 75.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: primaryColor,
          ),
          child: Center(
            child: Text(
              "#Funny",
              style: GoogleFonts.poppins(fontSize: 10.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
