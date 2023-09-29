import 'package:flutter/material.dart';

class YourCart extends StatelessWidget {

  final String id;
  bool isSeletedItem;
   YourCart({super.key, required this.id,required this.isSeletedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Your Cart '),
      ),
      body: Column(
        children: [Text(id),],
      ),
    );
  }
}
