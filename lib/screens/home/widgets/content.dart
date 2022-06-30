import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../secondpage.dart';

class Content extends StatelessWidget {
  const Content({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondPage(heroTag: image)));
            },
            child: Hero(
                tag: image,
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover)),
                )),
          ),
        ),
      ],
    );
  }
}
