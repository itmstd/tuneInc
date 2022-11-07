import 'package:flutter/material.dart';

import '../model/admin/admin_homepage_model/admin_homepage_model.dart';

class InfoCard extends StatelessWidget {
  PanelInfo panelInfo;

  InfoCard({Key? key, required this.panelInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(panelInfo.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          SizedBox(height: 5,),
          Text(panelInfo.number)
        ],
      ),
    );
  }
}
