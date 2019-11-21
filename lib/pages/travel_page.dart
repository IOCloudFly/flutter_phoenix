import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/home/bean/eye_open_bean.dart';
import 'package:flutter_phoenix/tools/vertical_text.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {

  final ItemList itemList;

  _TravelPageState({Key key, this.itemList});

  ///把视频时长duration转为时分秒
  String formatDuration(duration){
    var minute = duration ~/ 60;
    var second = duration % 60;
    var str;
    if(minute <= 9){
      if(second <= 9){
        str = "0$minute:0$second";
      }else{
        str = "0$minute:$second";
      }
    }else{
      if(second <= 9){
        str = "0$minute:0$second";
      }else{
        str = "0$minute:$second";
      }
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          itemImage(),

          Container(
            margin: EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ///头像
                ClipOval(
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: CachedNetworkImage( //图片缓存
                      imageUrl: 'http://img.kaiyanapp.com/af3ca29c0c9528f9134630613c1ec1c5.jpeg?imageMogr2/quality/60/format/jpg',
                      width: 40,
                      height: 40,
                      placeholder: (context,url) => CircularProgressIndicator( //圆形进度条
                        strokeWidth: 2.5,
                        backgroundColor: Colors.deepPurple[600],
                      ),
                    ),
                  ),
                ),
                ///平铺填充
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 15,top: 10,bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '里斯本寻鸭记：这里这么美，我要去看看',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 2,bottom: 2)),
                          Text(
                            '开眼旅行精选',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  flex: 1,
                ),
                //分享
                GestureDetector(
                  child: IconButton(
                    icon: Icon(
                      Icons.thumb_up,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: (){

                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  itemImage(){
    return  Container(
      padding: EdgeInsets.only(left: 15,right: 15,top: 10),
      child: Stack(
        children: <Widget>[
          videoImage(),
          itemWight(),

        ],
      ),
    );

  }

  ///视频图片
  videoImage(){
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: CachedNetworkImage(
          height: 200,
          //width: double.infinity,
          width: 800,
          fit: BoxFit.cover,
          ///视频图片
          imageUrl: 'http://img.kaiyanapp.com/b00bfcb899606454a8a0ac183f397d50.jpeg?imageMogr2/quality/60/format/jpg',
          errorWidget: (context,url,error) =>
              Image.asset('assets/img_load_fail.png'),
        ),
      ),
      ///点击图片跳转到视频详情页
      onTap: (){

      },
    );
  }

  ///视频两个组件，视频标签tag,视频时间
  itemWight(){
    return Positioned(
      child: Container(
        padding: EdgeInsets.only(
            left: 15,top: 10,bottom: 15,right: 15),
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      //标签
                      '影视',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x4DCD8C95),
                        Color(0x4DF0FFFF)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      '09:30',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(2),
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

