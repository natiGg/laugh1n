import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laugh1/screens/home/controller/initialcontroller.dart';
import 'package:laugh1/screens/home/widgets/avatar.dart';

class UserBar extends GetView<InitialController> {
  const UserBar({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar(image: image),
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
                  Text("Daisy", style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 5,
                  ),
                  Text("34 mins ago",
                      style: Theme.of(context).textTheme.bodyText2)
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
