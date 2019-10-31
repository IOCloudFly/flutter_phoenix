import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_phoenix/dao/home_dao.dart';
import 'package:flutter_phoenix/home/bean/home_bean_entity.dart';
import 'package:flutter_phoenix/home/customIcons.dart';
import 'dart:math';

const BING_HEAD = "https://cn.bing.com";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomePageState extends State<HomePage> {

  List<HomeBeanImage> imageList = [];

  ///滑动
  var currentPage;

  PageController controller;


//  _HomePageState(){
//    currentPage = imageList.length - 1;
//  }

  @override
  void initState() {

    //currentPage = imageList.length - 1;
    // TODO: implement initState
    super.initState();
    controller = PageController();
    controller.addListener((){
      setState(() {
        currentPage = controller.page;
      });
    });
    _homeDao();
  }

  //初始化
  Future<Null> _homeDao() async {
    try {
      HomeBeanEntity model = await HomeDao.fetch();
          imageList = model.images;
          controller.jumpToPage(imageList.length - 1);
          setState(() {
            currentPage = imageList.length - 1;
          });

    } catch (e) {
      print(e);

    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Trending",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffff6e6e),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 6.0),
                        child: Text("Animated",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text("8+ Stories",
                      style: TextStyle(color: Colors.blueAccent)),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                CardScrollWidget(currentPage,imageList),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: imageList.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {

                      return Container(
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  List<HomeBeanImage> imageList;

  CardScrollWidget(this.currentPage,this.imageList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context,contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;
          
          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;
          
          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;
          
          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;


          List<Widget> cardList = new List();

          for(var i = 0; i < imageList.length; i++){
            var delta = i - currentPage;
            //var delta = i;
            bool isOnRight = delta > 0;

            var start = padding +
                max(primaryCardLeft - horizontalInset * -delta *(isOnRight ? 15 : 1)
                    ,0.0);
            var cardItem = Positioned.directional(
                top: padding + verticalInset * max(-delta,0.0),
                bottom: padding + verticalInset * max(-delta,0.0),
                start: start,
                textDirection: TextDirection.rtl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    //装饰器
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(3.0,6.0),
                            blurRadius: 10.0,
                          )
                      ],
                    ),
                    child: AspectRatio(
                      aspectRatio: cardAspectRatio,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.network(BING_HEAD+imageList[i].url,fit: BoxFit.cover),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                                    child: Text(
                                      imageList[i].copyright,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontFamily: "SF-Pro-Text-Regular",

                                      ),
                                    ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}
