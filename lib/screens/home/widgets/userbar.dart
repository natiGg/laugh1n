import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laugh1/screens/home/widgets/avatar.dart';

class UserBar extends StatelessWidget {
  const UserBar({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar(image: image),
        // Container(
        //   height: 50.0,
        //   width: 50.0,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(25.0),
        //       image: DecorationImage(
        //           image: NetworkImage(
        //               "https://raw.githubusercontent.com/rajayogan/flutter-fashionheroes/master/assets/modelgrid1.jpeg"),
        //           fit: BoxFit.cover)),
        // ),
        SizedBox(
          width: 10.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 120.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daisy",
                    style: GoogleFonts.poppins(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "34 mins ago",
                    style:
                        GoogleFonts.poppins(fontSize: 12.0, color: Colors.grey),
                  )
                ],
              ),
              Icon(
                Icons.more_vert,
                color: Colors.grey,
                size: 20.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
