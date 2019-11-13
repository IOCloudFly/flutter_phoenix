import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpenEyePage extends StatefulWidget {
  @override
  _OpenEyePageState createState() => _OpenEyePageState();
}

class _OpenEyePageState extends State<OpenEyePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '开眼看世界'
        ),
      ),
    );
  }
}

