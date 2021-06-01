import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Clock_app/clock/colck_view.dart';

class ClockPage extends StatelessWidget {
  static const routename = '/clockPage';
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatedTime =
        new DateFormat.jm().format(DateTime.parse(now.toString()));
    var formatedDate = DateFormat('EEE, d MMM yyyy').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';

    if (timezoneString.startsWith('-')) {
      offsetSign = '+';
    }

    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: Color(0xFF2D2F41),
      height: height,
      width: width,
      child: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatedTime,
                        style: TextStyle(color: Colors.white, fontSize: 60),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        formatedDate,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child:
                        Align(alignment: Alignment.center, child: ClockView())),
                SizedBox(
                  height: 5,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Timezone',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'UTC' + ' ' + offsetSign + timezoneString,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            )
                          ],
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
