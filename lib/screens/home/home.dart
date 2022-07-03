import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laugh1/screens/constants/constants.dart';
import 'package:laugh1/screens/home/secondpage.dart';
import 'package:laugh1/screens/home/widgets/animatedgif.dart';
import 'package:laugh1/screens/home/widgets/content.dart';
import 'package:laugh1/screens/home/widgets/hashtags.dart';
import 'package:laugh1/screens/home/widgets/post.dart';
import 'package:laugh1/screens/home/widgets/reaction.dart';
import 'package:laugh1/screens/home/widgets/shimmer.dart';
import 'package:laugh1/screens/home/widgets/userbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool _show = false;

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Text(
                "Laugh1",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            color: primaryColor,
            onPressed: () {},
          )
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: GifHeader1(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
          children: [
            Post(
              image:
                  "https://www.boredpanda.com/blog/wp-content/uploads/2019/04/funny-boss-memes-fb29.png",
              caption:
                  "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
              level: "#Pro",
            ),
            Post(
              image:
                  "https://i.pinimg.com/750x/dc/4b/10/dc4b101f7c86f29ed800bc44919028ae.jpg",
              caption:
                  "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
              level: "#Amateur",
            ),
            Post(
              image:
                  "https://www.boredpanda.com/blog/wp-content/uploads/2019/04/funny-boss-memes-fb29.png",
              caption:
                  "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
              level: "#Comedian",
            ),
            Post(
              image:
                  "https://dontgetserious.com/wp-content/uploads/2021/07/Awkward-Meme-768x646.jpeg",
              caption:
                  "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
              level: "#Beginner",
            ),
            Post(
              image:
                  "https://www.boredpanda.com/blog/wp-content/uploads/2019/04/funny-boss-memes-fb29.png",
              caption:
                  "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
              level: "#Beginner",
            ),
            Post(
              image:
                  "https://raw.githubusercontent.com/rajayogan/flutter-fashionheroes/master/assets/modelgrid1.jpeg",
              caption:
                  "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
              level: "#Pro/Roaster",
            ),
            Post(
              image:
                  "https://www.boredpanda.com/blog/wp-content/uploads/2019/04/funny-boss-memes-fb29.png",
              caption:
                  "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
              level: "#Beginner",
            ),
            Post(
              image:
                  "https://www.boredpanda.com/blog/wp-content/uploads/2019/04/funny-boss-memes-fb29.png",
              caption:
                  "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
              level: "#Pro",
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          postModal(context);
        },
        child: Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(
                // border: Border.all(color: primaryColor),
                color: primaryColor,
                borderRadius: BorderRadius.circular(25)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Add Joke",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold)),
                  Image.asset(
                    "assets/images/jokes2.jpg",
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
                ])),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.transparent,
          tabs: [
            InkWell(
              onTap: () {
                Get.to(MyApp());
              },
              child: Tab(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                  size: 15.0,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.group_add,
                color: Colors.grey,
                size: 15.0,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
                size: 15.0,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.grey,
                size: 15.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey.shade200,
          alignment: Alignment.center,
          child: ElevatedButton(
            child: Text("Close Bottom Sheet"),
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  void postModal(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://qstar.mindethiopia.com/api/getProfilePicture/1")),
                      const SizedBox(width: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.9))),
                          child: FlatButton(
                            onPressed: () {},
                            child: Row(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(
                                  "public" == "public"
                                      ? Icons.public
                                      : "friends" == "friends"
                                          ? Icons
                                              .supervised_user_circle_outlined
                                          : Icons.star,
                                  color: primaryColor,
                                  size: 20,
                                ),
                                Text("public")
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 40,
                        ),
                        child: Expanded(
                          child: Container(
                            height: 40,
                            width:
                                // ignore: unrelated_type_equality_checks
                                true == false ? 64 : 90,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: primaryColor)),
                            child: FlatButton(
                              onPressed: () {
                                // postController.createPost();
                              },
                              // ignore: unrelated_type_equality_checks
                              child: false == false
                                  ? Center(
                                      // ignore: unrelated_type_equality_checks
                                      child: false == false
                                          ? const Text(
                                              'Post',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            )
                                          : const Text(
                                              'Posted',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ))
                                  : const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                            // ignore: unrelated_type_equality_checks
                                            color: Colors.white),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      height: 250,
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      minLines: 1,
                                      maxLines:
                                          2, // allow user to enter 5 line in textfield
                                      keyboardType: TextInputType
                                          .multiline, // user keyboard will have a button to move cursor to next line

                                      decoration:
                                          const InputDecoration.collapsed(
                                              hintText: 'What\'s on your mind?',
                                              hintStyle: TextStyle(
                                                fontSize: 15,
                                              )),

                                      validator: (value) {},
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FlatButton.icon(
                                      onPressed: () {
                                        // _showVideoPicker(context);
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.video,
                                        color: Colors.red,
                                      ),
                                      label: const Text('Add your Video'),
                                    ),
                                    FlatButton.icon(
                                      // ignore: avoid_print
                                      onPressed: () {
                                        // _showPicker(context);
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.photoFilm,
                                        color: Colors.green,
                                      ),
                                      label: const Text('Add Photo'),
                                    ),
                                    FlatButton.icon(
                                      // ignore: avoid_print
                                      onPressed: () {
                                        // _showPeople(context);
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.user,
                                        color: primaryColor,
                                      ),
                                      label: const Text('Add People'),
                                    ),
                                    FlatButton.icon(
                                      // ignore: avoid_print
                                      onPressed: () {
                                        // _showFeeling(context);
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.faceSmile,
                                        color: Colors.amber,
                                      ),
                                      label: const Text('Feeling Activity'),
                                    ),
                                    FlatButton.icon(
                                      // ignore: avoid_print
                                      onPressed: () {
                                        // _showLocation(context);
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.locationArrow,
                                        color: Colors.green,
                                      ),
                                      label: const Text('Add  Location'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
