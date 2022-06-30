import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laugh1/screens/constants/constants.dart';
import 'package:laugh1/screens/home/secondpage.dart';
import 'package:laugh1/screens/home/widgets/animatedgif.dart';
import 'package:laugh1/screens/home/widgets/content.dart';
import 'package:laugh1/screens/home/widgets/hashtags.dart';
import 'package:laugh1/screens/home/widgets/post.dart';
import 'package:laugh1/screens/home/widgets/reaction.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "Laugh1",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
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
      // body: SmartRefresher(
      //   enablePullDown: true,
      //   enablePullUp: true,
      //   header: WaterDropHeader(),
      //   controller: _refreshController,
      //   onRefresh: _onRefresh,
      //   onLoading: _onLoading,
      //   child: ListView.builder(
      //     itemBuilder: (c, i) => Post(
      //       image:
      //           "https://www.boredpanda.com/blog/wp-content/uploads/2019/04/funny-boss-memes-fb29.png",
      //       caption: items[i],
      //       level: "#Pro",
      //     ),
      //     itemExtent: 100.0,
      //     itemCount: items.length,
      //   ),
      // ),
      // bottomNavigationBar: Material(
      //   color: Colors.white,
      //   child: TabBar(
      //     controller: controller,
      //     indicatorColor: Colors.transparent,
      //     tabs: [
      //       Tab(
      //         icon: Icon(
      //           Icons.more,
      //           color: Colors.grey,
      //           size: 15.0,
      //         ),
      //       ),
      //       Tab(
      //         icon: Icon(
      //           Icons.play_arrow,
      //           color: Colors.grey,
      //           size: 15.0,
      //         ),
      //       ),
      //       Tab(
      //         icon: Icon(
      //           Icons.navigation,
      //           color: Colors.black,
      //           size: 15.0,
      //         ),
      //       ),
      //       Tab(
      //         icon: Icon(
      //           Icons.supervised_user_circle,
      //           color: Colors.grey,
      //           size: 15.0,
      //         ),
      //       )
      //     ],
      //   ),
      // ));
      // );
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
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 50,
                      color: kTextColor.withOpacity(.1),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(14),
                      height: 56,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFEDEE),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: SvgPicture.network(
                          "https://raw.githubusercontent.com/abuanwar072/Course-App/5bfe72ba5f1f598d63a748a8f73ae13559bce3ac/assets/icons/shopping-bag.svg"),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: primaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "See More",
                              style: kSubtitleTextSyule.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.more,
                color: Colors.grey,
                size: 15.0,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.play_arrow,
                color: Colors.grey,
                size: 15.0,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.navigation,
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
}
