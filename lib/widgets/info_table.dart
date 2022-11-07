import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos_app/model/admin/admin_homepage_model/admin_homepage_model.dart';

class InfoTable extends StatelessWidget {
  List<TableInfo> tableInfo;

  InfoTable({Key? key, required this.tableInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(children: [
        Row(
          children: [
            Expanded(child: Text('Full Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
            Expanded(child: Text('Username', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
            Expanded(child: Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
            Expanded(child: Text('Membership', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
            Expanded(child: Text('Expiry date', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
            Expanded(child: Text('Date registered', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
          ],
        ),
        SizedBox(height: 5,),
        Divider(),
        SizedBox(height: 5,),
        Expanded(
          child: ListView(children: [
            ...tableInfo.map((e) => Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(child: Text(e.fullName, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),)),
                Expanded(child: Text(e.username, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),)),
                Expanded(child: Text(e.email, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),)),
                Expanded(child: Text(e.membership, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),)),
                Expanded(child: Text(e.expiryDate, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),)),
                Expanded(child: Text(e.dateRegistered, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),)),
              ],
            ),
          ))
          ],),
        ),
      ],),
    );
  }
}
