import 'package:flutter/material.dart';

class ListViewListTile extends StatelessWidget {
  String content;
  Function onTap;
   ListViewListTile({Key? key,required this.content,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap(),
      child: Container(
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
      ),
    );
  }
}
