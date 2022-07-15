import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laugh1/screens/constants/constants.dart';
import 'package:laugh1/screens/home/controller/initialcontroller.dart';
import 'package:laugh1/screens/home/secondpage.dart';
import 'package:laugh1/screens/home/widgets/animatedgif.dart';
import 'package:laugh1/screens/home/widgets/avatar.dart';
import 'package:laugh1/screens/home/widgets/content.dart';
import 'package:laugh1/screens/home/widgets/hashtags.dart';
import 'package:laugh1/screens/home/widgets/loading.dart';
import 'package:laugh1/screens/home/widgets/post.dart';
import 'package:laugh1/screens/home/widgets/reaction.dart';
import 'package:laugh1/screens/home/widgets/shimmer.dart';
import 'package:laugh1/screens/home/widgets/shimmer_post.dart';
import 'package:laugh1/screens/home/widgets/userbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'controller/maincontroller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final signUpcontroller = Get.find<MainController>();
  final initController = Get.find<InitialController>();
  late TabController controller;
  List isSelected = [true, false, false, false];
  bool tapped = false;
  late Theme theme;
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool _show = false;
  bool _isRefreshed = false;
  @override
  bool get wantKeepAlive => true;

  void _onRefresh() async {
    setState(() {
      _isRefreshed = !_isRefreshed;
    });
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();

    setState(() {
      _isRefreshed = !_isRefreshed;
    });
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
              Text("Laugh1", style: Theme.of(context).textTheme.headline6)
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(initController.isLightTheme.value
                ? Icons.dark_mode
                : Icons.light_mode_sharp),
            color:
                initController.isLightTheme.value ? primaryColor : Colors.white,
            onPressed: () {
              initController.toggleTheme();
            },
          ),
          IconButton(
            icon: Icon(Icons.chat),
            color:
                initController.isLightTheme.value ? primaryColor : Colors.white,
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
            !_isRefreshed
                ? Post(
                    image:
                        "https://www.boredpanda.com/blog/wp-content/uploads/2019/04/funny-boss-memes-fb29.png",
                    caption:
                        "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
                    level: "Pro",
                  )
                : ShimerPost(),
            !_isRefreshed
                ? Post(
                    image:
                        "https://i.pinimg.com/750x/dc/4b/10/dc4b101f7c86f29ed800bc44919028ae.jpg",
                    caption:
                        "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
                    level: "Amateur",
                  )
                : ShimerPost(),
            !_isRefreshed
                ? Post(
                    image:
                        "https://www.boredpanda.com/blog/wp-content/uploads/2019/04/funny-boss-memes-fb29.png",
                    caption:
                        "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
                    level: "Comedian",
                  )
                : ShimerPost(),
            !_isRefreshed
                ? Post(
                    image:
                        "https://dontgetserious.com/wp-content/uploads/2021/07/Awkward-Meme-768x646.jpeg",
                    caption:
                        "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
                    level: "Beginner",
                  )
                : ShimerPost(),
            !_isRefreshed
                ? Post(
                    image:
                        "https://www.boredpanda.com/blog/wp-content/uploads/2019/04/funny-boss-memes-fb29.png",
                    caption:
                        "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
                    level: "Beginner",
                  )
                : ShimerPost(),
            Post(
              image:
                  "https://raw.githubusercontent.com/rajayogan/flutter-fashionheroes/master/assets/modelgrid1.jpeg",
              caption:
                  "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
              level: "Pro/Roaster",
            ),
            Post(
              image:
                  "https://www.boredpanda.com/blog/wp-content/uploads/2019/04/funny-boss-memes-fb29.png",
              caption:
                  "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
              level: "Beginner",
            ),
            !_isRefreshed
                ? Post(
                    image:
                        "https://www.boredpanda.com/blog/wp-content/uploads/2019/04/funny-boss-memes-fb29.png",
                    caption:
                        "'This official website features a ribbed knit zipper jacket that is modern and stylish. It looks very temparament and is recommended to friends',",
                    level: "Pro",
                  )
                : ShimerPost(),
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
        color: initController.isDarkMode.value ? Colors.black : Colors.white,
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.transparent,
          tabs: [
            InkWell(
              onTap: () {},
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

  void postModal(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        backgroundColor:
            initController.isLightTheme.value ? Colors.white : Colors.black87,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            initController.isLightTheme.value
                                ? "assets/images/pro1.png"
                                : "assets/images/pro2.png",
                            height: 30,
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Beginner",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      Avatar(
                          image:
                              "https://dontgetserious.com/wp-content/uploads/2021/07/Awkward-Meme-768x646.jpeg"),
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
                                              hintText: 'tell us your joke',
                                              hintStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "Montserrat")),

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
                          // const Divider(
                          //   thickness: 1,
                          // ),
                          SizedBox(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(.4),
                                                blurRadius: 5,
                                                offset: Offset(0, 5))
                                          ]),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              signUpcontroller
                                                  .selectImagesFile();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0),
                                              child: Center(
                                                  child: Icon(
                                                Icons.camera,
                                                color: Colors.grey[500],
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                            child: Text("Add Photo",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.grey[500],
                                                    fontSize: 10.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 25),
                                      child: Container(
                                        width: 120,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.white
                                                      .withOpacity(.4),
                                                  blurRadius: 5,
                                                  offset: Offset(0, 5))
                                            ]),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0),
                                              child: Center(
                                                  child: Icon(
                                                FontAwesomeIcons.video,
                                                color: Colors.grey[500],
                                              )),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Expanded(
                                              child: Text("Add Video",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.grey[500],
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      tapped = !tapped;
                                    });
                                  },
                                  child: Container(
                                      width: 40,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          // border: Border.all(color: primaryColor),
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: !tapped
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                  Text("Make A joke",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Image.asset(
                                                    "assets/images/jokes2.jpg",
                                                    height: 25,
                                                    width: 25,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ])
                                          : Center(
                                              child: ColorLoader5(),
                                            )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}
