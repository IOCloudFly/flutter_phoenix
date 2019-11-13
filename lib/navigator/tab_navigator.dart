import 'package:flutter/material.dart';
import 'package:flutter_phoenix/net/http_utils.dart';
import 'package:flutter_phoenix/pages/home_page.dart';
import 'package:flutter_phoenix/pages/openeye_page.dart';
import 'package:flutter_phoenix/pages/poetry_page.dart';
import 'package:flutter_phoenix/pages/time_page.dart';
import 'package:flutter_phoenix/pages/travel_page.dart';

//设置底部导航栏
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
  );
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController, // 控制滑动index
          children: <Widget>[
            HomePage(),
            TimeClockPage(),
            TravelPage(),
            OpenEyePage(),
            PoetryPage(),

          ],
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed, //显示底部导航栏文字
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _defaultColor),
                activeIcon: Icon(Icons.home, color: _activeColor),
                title: Text(
                  '首页',
                  style: TextStyle(
                      color: _currentIndex != 0 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.av_timer,
                  color: _defaultColor,
                ),
                activeIcon: Icon(Icons.av_timer, color: _activeColor),
                title: Text(
                  '时钟',
                  style: TextStyle(
                      color: _currentIndex != 1 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.linked_camera, color: _defaultColor),
                activeIcon: Icon(
                  Icons.linked_camera,
                  color: _activeColor,
                ),
                title: Text(
                  '旅拍',
                  style: TextStyle(
                      color: _currentIndex != 2 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.ondemand_video,
                color: _defaultColor,
              ),
              activeIcon: Icon(Icons.ondemand_video,color: _activeColor),
              title: Text(
                '开眼',
                style: TextStyle(
                  color: _currentIndex != 3 ? _defaultColor : _activeColor),
              )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.event_note,
                  color: _defaultColor,
                ),
                activeIcon: Icon(Icons.event_note, color: _activeColor),
                title: Text(
                  '句读',
                  style: TextStyle(
                      color: _currentIndex != 4 ? _defaultColor : _activeColor),
                ))
          ],
        ));
  }

  Future getToken() async {
  try{

    var token= await HttpUtils .getInstance().getToken();
    HttpUtils.getInstance().token = token;
  }catch(e){}

  }
}
