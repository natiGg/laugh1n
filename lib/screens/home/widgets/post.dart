import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laugh1/screens/constants/constants.dart';
import 'package:laugh1/screens/home/controller/initialcontroller.dart';
import 'package:laugh1/screens/home/widgets/reaction.dart';
import 'package:laugh1/screens/home/widgets/userbar.dart';
import 'package:readmore/readmore.dart';
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

class _PostState extends State<Post>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final initialController = Get.find<InitialController>();
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
                color: initialController.isDarkMode.value
                    ? Colors.black87
                    : Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        initialController.isLightTheme.value
                            ? "assets/images/pro1.png"
                            : "assets/images/pro2.png",
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        widget.level,
                        style: Theme.of(context).textTheme.headline6,
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
                  // ReadMoreText(
                  //   widget.caption,
                  //   style: GoogleFonts.montserrat(
                  //       fontSize: 12.0, color: Colors.grey),
                  // ),
                  ReadMoreText(
                    widget.caption,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    style: Theme.of(context).textTheme.bodyText1,
                    // trimExpandedText: 'Show less',
                    moreStyle: GoogleFonts.montserrat(
                        fontSize: 13.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
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
                children: [Level()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

final iconsize = 18.0;

Widget timelinePostBox() {
  final tabtext = 13.0;
  return Container(
    width: Get.width * 0.8,
    color: Colors.white,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13.0, right: 13.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          // Image.asset("images/reactionicon/like.png"),
                          Text("post.likedbyUser"),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text("celebrates this",
                              style: GoogleFonts.montserrat(
                                color: primaryColor,
                                fontSize: 15.0,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                height: 1,
                color: primaryColor,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                    // child: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Icon(
                    //     Icons.person_outline,
                    //     size: 30.0,
                    //   ),
                    // ),
                  ),
                  SizedBox(
                    width: 17.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "post.name",
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          " post.profession",
                          style: GoogleFonts.lato(
                              color: primaryColor, fontSize: 13.0),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Row(
                          children: [
                            Text(
                              '1w',
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            Icon(
                              Icons.public,
                              color: primaryColor,
                              size: 19.0,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              ReadMoreText(
                "                post.description",
                trimLines: 2,
                colorClickableText: primaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Show more',
                trimExpandedText: ' show less',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),

        SizedBox(
          height: 14.0,
        ),
        reactionBox(),
        SizedBox(
          height: 10.0,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: primaryColor),
                  top: BorderSide(width: 1, color: primaryColor))),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 13.0, right: 13.0, top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.thumb_up_alt,
                      color: primaryColor,
                      size: iconsize,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Like",
                        style: GoogleFonts.actor(
                            fontSize: tabtext,
                            color: primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.comment,
                      size: iconsize,
                      color: primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Comment",
                        style: GoogleFonts.actor(
                            fontSize: tabtext,
                            color: primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share,
                      size: iconsize,
                      color: primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Share",
                        style: GoogleFonts.actor(
                            fontSize: tabtext,
                            color: primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.send,
                      size: iconsize,
                      color: primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Send",
                        style: GoogleFonts.actor(
                            fontSize: tabtext,
                            color: primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // SizedBox(
        //   height: 15.0,
        // ),
        dividerwidget(height: 4.0, thickness: 4.0),
      ],
    ),
  );
}

Widget dividerwidget({height, thickness}) {
  return Divider(
    height: height,
    thickness: thickness,
    color: primaryColor,
  );
}

Widget reactionBox() {
  return Container(
    width: Get.width,
    height: 38.0,
    child: Padding(
      padding: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 13.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 35.0,
            width: 70.0,
            child: Stack(
              children: [
                Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(width: 1, color: Colors.white),
                      shape: BoxShape.circle),
                  child: Image.asset(
                    "images/reactionicon/react1.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 17,
                  child: Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          color: Colors.blue,
                          shape: BoxShape.circle),
                      child: Image.asset(
                        "images/reactionicon/react2.png",
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                  left: 34.0,
                  child: Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          color: Colors.blue,
                          shape: BoxShape.circle),
                      child: Image.asset(
                        "images/reactionicon/react3.png",
                        fit: BoxFit.fill,
                      )),
                )
              ],
            ),
          ),
          Text(
            "92,928 ",
          ),
          Spacer(),
          Text("90 comments")
        ],
      ),
    ),
  );
}
