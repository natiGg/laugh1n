import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laugh1/screens/constants/constants.dart';
import 'package:laugh1/screens/home/widgets/reaction.dart';
import 'package:laugh1/screens/home/widgets/userbar.dart';

import 'content.dart';
import 'hashtags.dart';

class Post extends StatefulWidget {
  const Post(
      {Key? key,
      required this.image,
      required this.caption,
      required this.level})
      : super(key: key);

  final String image;
  final String caption;
  final String level;
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        elevation: 3.0,
        child: Stack(
          children: [
            Container(
              height: 480.0,
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.level,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UserBar(
                    image: widget.image,
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    widget.caption,
                    style: GoogleFonts.montserrat(
                        fontSize: 12.0, color: Colors.grey),
                  ),
                  SizedBox(height: 10.0),
                  Content(image: widget.image),
                  SizedBox(
                    height: 10.0,
                  ),
                  // HashTags(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(child: Reaction()),
                ],
              ),
            ),
            Container(
              height: 480.0,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Level()
                  // Container(
                  //   height: 25,
                  //   width: double.infinity,
                  //   padding: EdgeInsets.all(15.0),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(15),
                  //         bottomRight: Radius.circular(15)),
                  //     gradient: LinearGradient(
                  //       colors: [
                  //         Colors.amber,
                  //         const Color(0xFFF26E01),
                  //       ],
                  //       begin: const FractionalOffset(0.0, 0.0),
                  //       end: const FractionalOffset(1.0, 0.0),
                  //       stops: [0.0, 1.0],
                  //       tileMode: TileMode.clamp,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
