import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  var selectedTabIndex;
  Function(int) changeTabListener;

  Tabs({this.selectedTabIndex, this.changeTabListener});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 24),
        MyTab(
            text: 'Featured',
            isSelected: selectedTabIndex == 0,
            changeTabListener: changeTabListener,
            index: 0),
        MyTab(
            text: 'Android',
            isSelected: selectedTabIndex == 1,
            changeTabListener: changeTabListener,
            index: 1),
        MyTab(
            text: 'iOS',
            isSelected: selectedTabIndex == 2,
            changeTabListener: changeTabListener,
            index: 2),
      ],
    );
  }
}

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final int index;
  final Function(int) changeTabListener;

  const MyTab(
      {Key key,
      @required this.isSelected,
      @required this.text,
      @required this.changeTabListener,
      @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => changeTabListener(index),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: isSelected ? 16 : 14,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            Container(
              height: 6,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isSelected ? Colors.purple : Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
