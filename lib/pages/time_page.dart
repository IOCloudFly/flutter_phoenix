import 'package:flutter/material.dart';
import 'package:flutter_phoenix/clock/clock.dart';
import 'package:flutter_phoenix/clock/clock_text.dart';
import 'package:flutter_phoenix/clock/screens/first_screen.dart';
import 'package:flutter_phoenix/clock/screens/second_screen.dart';


class TimeClockPage extends StatefulWidget {
  @override
  _TimeClockPageState createState() => _TimeClockPageState();
}

class _TimeClockPageState extends State<TimeClockPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomBar(),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(55),
              child: Container(
                color: Colors.transparent,
                child: SafeArea(
                    child: Column(
                  children: <Widget>[
                    TabBar(
                        indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                                color: Color(0xffff0863), width: 4.0),
                            insets: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0.0)),
                        indicatorWeight: 15,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Color(0xff2d386b),
                        labelStyle: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1.3,
                            fontWeight: FontWeight.w500),
                        unselectedLabelColor: Colors.black26,
                        tabs: [
                          Tab(
                            text: "ALARMS",
                            icon: Icon(
                              Icons.watch_later,
                              size: 40,
                            ),
                          ),
                          Tab(
                            text: "RECORDS",
                            icon: Icon(
                              Icons.menu,
                              size: 40,
                            ),
                          ),
                          Tab(
                            text: "PROFILE",
                            icon: Icon(
                              Icons.supervised_user_circle,
                              size: 40,
                            ),
                          ),
                        ])
                  ],
                )),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: FirstTab(), //
              ),
              Center(
                child: SecondTab(),
              ),
              Text('世界'),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            child: Text(
              "EDIT ALARMS",
              style: TextStyle(letterSpacing: 1.5),
            ),
            color: Color(0xffff5e92),
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () {},
          ),
          FloatingActionButton(
            child: Text(
              "+",
              style: TextStyle(
                color: Color(0xff253165),
                fontWeight: FontWeight.w700,
                fontSize: 25
              ),
            ),
            onPressed: (){},
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 5,
            highlightElevation: 3,
          )
        ],
      ),
    );
  }
}
