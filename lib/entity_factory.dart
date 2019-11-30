import 'package:flutter_phoenix/home/bean/eye_bean_entity.dart';
import 'package:flutter_phoenix/home/bean/poetry_bean_entity.dart';
import 'package:flutter_phoenix/home/bean/home_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "PoetryBeanEntity") {
      return PoetryBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "IssueEntity") {
      return IssueEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeBeanEntity") {
      return HomeBeanEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}