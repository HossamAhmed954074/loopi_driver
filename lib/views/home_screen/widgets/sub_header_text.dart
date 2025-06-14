
import 'package:flutter/material.dart';

import '../../profile_screen/widgets/divider_custom_widget.dart';

class SubComponentCustomWidget extends StatelessWidget {
  const SubComponentCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '! صباح الخير ',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('... هذه هي رحلاتك القادمة'),
          SizedBox(height: 15),
          DividerCustomWidget(),
        ],
      ),
    );
  }
}
