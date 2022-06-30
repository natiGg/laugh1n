import 'package:flutter/material.dart';
import 'package:laugh1/screens/constants/constants.dart';

class Avatar extends StatefulWidget {
  final String image;
  const Avatar({Key? key, required this.image}) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar>
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
    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
              stops: [
                _animation.value - 0.2,
                _animation.value + 1,
                _animation.value + 0.3,
              ],
              colors: [
                primaryColor,
                Colors.amber,
                primaryColor,
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.6),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                    radius: 20, backgroundImage: NetworkImage(widget.image)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
