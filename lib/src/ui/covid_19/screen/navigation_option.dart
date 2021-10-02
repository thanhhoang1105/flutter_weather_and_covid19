import 'package:flutter/material.dart';
import 'package:ggmap/src/constants/color.dart';

class NavigationOption extends StatelessWidget {
  final String title;
  final bool selected;
  final Function() onSelected;

  const NavigationOption(
      {Key? key,
      required this.title,
      required this.selected,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: selected ? kPrimaryColors : Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          selected
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: kPrimaryColors,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
