import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmDialogWidget extends StatelessWidget {
  final String title;
  final String desc;
  ConfirmDialogWidget({@required this.title, @required this.desc});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding:  EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$title',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10),
            Text(
              '$desc',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () => Get.back(result: false),
                  child: Text('Cancel'),
                ),
                FlatButton(
                  onPressed: () => Get.back(result: true),
                  child: Text('Confirm'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
