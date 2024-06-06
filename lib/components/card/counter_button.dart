import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

class CounterButtonWidget extends StatelessWidget {
  const CounterButtonWidget(
      {super.key, required this.height, this.onPressed, required this.value});

  final double height;
  final void Function()? onPressed;
  final int value;

  @override
  Widget build(BuildContext context) {
    final incrimentText = value > 0 ? '+' : '-';
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(0, 0)),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16),
        ),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(100, 0, 0, 0)),
        overlayColor:
            MaterialStateProperty.all(const Color.fromARGB(100, 0, 0, 0)),
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed: onPressed,
      child: Container(
        height: height,
        constraints: BoxConstraints(minWidth: height * 1.6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              child: Text(
                incrimentText,
                style: const TextStyle(
                    color: ColorTheme.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 2),
            FittedBox(
              child: Text(
                value.abs().toString(),
                style: const TextStyle(
                    color: ColorTheme.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
