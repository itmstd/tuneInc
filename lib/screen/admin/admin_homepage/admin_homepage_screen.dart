import 'package:flutter/cupertino.dart';
import 'package:flutter_pos_app/constants.dart';
import 'package:flutter_pos_app/model/admin/admin_homepage_model/admin_homepage_model.dart';
import 'package:flutter_pos_app/widgets/info_card.dart';
import 'package:flutter_pos_app/widgets/info_table.dart';

class AdminPageScreen extends StatelessWidget {
  const AdminPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InfoCard(panelInfo: PanelInfo(title: 'Total Users', number: '120'),),
            InfoCard(panelInfo: PanelInfo(title: 'Active Users', number: '80'),),
            InfoCard(panelInfo: PanelInfo(title: 'Premium Users', number: '50'),),
            InfoCard(panelInfo: PanelInfo(title: 'Free Users', number: '70'),),
          ],
        ),
        Expanded(child: InfoTable(tableInfo: userList))
      ],
    );
  }
}
