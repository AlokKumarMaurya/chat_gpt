import 'package:flutter/material.dart';

class ListViewListTile extends StatelessWidget {
  String content;
   ListViewListTile({Key? key,required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text(content,style: TextStyle(
        color: Theme.of(context).cardColor,
        fontWeight: FontWeight.normal,
        fontSize: 14
      ),),
    );
  }
}
