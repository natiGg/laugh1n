import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reaction extends StatelessWidget {
  const Reaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/laughing.gif",
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "2.3k",
                    style:
                        TextStyle(color: Colors.grey, fontFamily: "Montserrat"),
                  )
                ],
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width - 250),
            Icon(
              Icons.reply,
              color: Colors.grey.withOpacity(0.4),
              size: 20.0,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              "1.7k",
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
            SizedBox(
              width: 20.0,
            ),
            Image.asset(
              "assets/images/notfunny.png",
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              "1.7k",
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
            // Icon(
            //   Icons.comment,
            //   color: Colors.grey.withOpacity(0.4),
            //   size: 20.0,
            // ),
            // SizedBox(width: 5.0),
            // Text(
            //   '325',
            //   style: GoogleFonts.poppins(color: Colors.grey),
            // ),
          ],
        ),
      ],
    );
  }
}

class Level extends StatefulWidget {
  const Level({Key? key}) : super(key: key);

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late Animation<double> animation_1;
  late Animation<double> animation_2;
  late AnimationController controller;
  double rotationAngle = 0;
  late final Animation<double> _animation;
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    )..addListener(() {
        setState(() {});
      }));
    controller.repeat(reverse: true);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: double.infinity,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        gradient: LinearGradient(
          colors: [
            Colors.amber,
            const Color(0xFFF26E01),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(3.0, 0.0),
          stops: [0.0, _animation.value + 0.1],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}
