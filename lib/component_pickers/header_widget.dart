import 'package:flutter/material.dart';
import 'package:pick_date_time_package/constants/constants.dart';

const fontSize = 20.0;
const textStyle = TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold);

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.itemExtent * 1.30,
      width: Constants.containerWidth,
      color: Colors.amber,
      child: _row(),
    );
  }

  Widget _headerWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _caption('Sat Dec 6, 2020'),
          _caption('7:12 AM'),
        ],
      ),
    );
  }

  Widget _row() {
    return Row(
      children: [
        _headerWidget(),
        Expanded(child: Container()),
        _button(),
      ],
    );
  }

  Widget _button() {
    return IconButton(
      icon: Icon(Icons.volume_up),
      tooltip: 'Increase volume by 10',
      onPressed: () {},
    );
  }

  Widget _caption(String string) {
    return Text(
      string,
      style: textStyle,
    );
  }
}
