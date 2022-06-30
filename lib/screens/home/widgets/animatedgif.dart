import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;

/*
  I use my plugin to implements gif effect,this plugin can help you to controll gif easily,
  see page to find about usage: (https://github.com/peng8350/flutter_gifimage)
*/
class GifHeader1 extends RefreshIndicator {
  GifHeader1() : super(height: 80.0, refreshStyle: RefreshStyle.Follow);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GifHeader1State();
  }
}

class GifHeader1State extends RefreshIndicatorState<GifHeader1>
    with SingleTickerProviderStateMixin {
  late GifController _gifController;
  @override
  void initState() {
    // TODO: implement initState
    // init frame is 2
    _gifController = GifController(
      vsync: this,
      value: 1,
    );
    super.initState();
  }

  // @override
  // void onModeChange(RefreshStatus mode) {
  //   // TODO: implement onModeChange
  //   if (mode == RefreshStatus.refreshing) {
  //     _gifController.repeat(
  //         min: 0, max: 29, period: Duration(milliseconds: 500));
  //   }
  //   super.onModeChange(mode);
  // }

  @override
  Future<void> endRefresh() {
    // TODO: implement endRefresh
    _gifController.value = 30;
    return _gifController.animateTo(59, duration: Duration(milliseconds: 500));
  }

  @override
  void resetValue() {
    // TODO: implement resetValue
    // reset not ok , the plugin need to update lowwer
    _gifController.value = 0;
    super.resetValue();
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    // TODO: implement buildContent
    return Image(
      image: AssetImage("assets/images/laughing.gif"),
      height: 80.0,
      width: 537.0,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _gifController.dispose();
    super.dispose();
  }
}

class GifFooter1 extends StatefulWidget {
  GifFooter1() : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GifFooter1State();
  }
}

class _GifFooter1State extends State<GifFooter1>
    with SingleTickerProviderStateMixin {
  late GifController _gifController;

  @override
  void initState() {
    // TODO: implement initState
    // init frame is 2
    _gifController = GifController(
      vsync: this,
      value: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomFooter(
      height: 80,
      builder: (context, mode) {
        return Image(
          image: AssetImage("assets/images/laughing.gif"),
          height: 80.0,
          width: 537.0,
        );
      },
      loadStyle: LoadStyle.ShowWhenLoading,
      onModeChange: (mode) {
        if (mode == LoadStatus.loading) {
          _gifController.repeat(
              min: 0, max: 29, period: Duration(milliseconds: 500));
        }
      },
      endLoading: () async {
        _gifController.value = 30;
        return _gifController.animateTo(59,
            duration: Duration(milliseconds: 500));
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _gifController.dispose();
    super.dispose();
  }
}
