//primarybutton
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turn1checker/theme/color.dart';

class DeckListTile extends StatelessWidget {
  const DeckListTile({super.key, required this.name, required this.time});

  final String name;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
          border: Border.all(color: ColorTheme.lightGray, width: 1),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorTheme.secondaryGradientStart,
                ColorTheme.secondaryGradientEnd
              ])),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(DateFormat('yyyy/MM/dd HH:mm').format(time),
                      style: const TextStyle(
                          fontSize: 10,
                          height: 1,
                          color: ColorTheme.lightGray)),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                        color: ColorTheme.white,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: null,
                icon: const Icon(
                  Icons.edit,
                  color: ColorTheme.white,
                  shadows: [
                    Shadow(
                        color: ColorTheme.secondary,
                        offset: Offset(0.5, 0.5),
                        blurRadius: 8)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
