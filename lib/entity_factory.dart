import 'package:flutter_phoenix/home/bean/home_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeBeanEntity") {
      return HomeBeanEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}