import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/home/bean/eye_open_bean.dart';

///视频每个item 的UI部门
/// 时间，标题，标签，头像，视频图片
///

class EyePageItem extends StatelessWidget {

  final ItemList itemList;

  const EyePageItem({Key key, this.itemList}) : super(key: key);

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

          ),
        ],
      ),
    );
  }

  ///视频图片部分
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
            width: double.infinity,
            fit: BoxFit.cover,
            ///视频图片
            imageUrl: itemList.data.cover.feed,
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
                        itemList.data.category,
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
                          formatDuration(itemList.data.duration),
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
