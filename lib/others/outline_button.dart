import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color borderColor;
  final Color? splashColor;
  const CustomOutlineButton({Key? key,
    required this.child,required this.onPressed, this.borderRadius, this.height,
    this.width,required this.borderColor, this.splashColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius??10.0)),
      splashColor: splashColor??Colors.greenAccent,
      child: Container(
        height: height??50.0,
        width: width??300.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??10.0)),
            border: Border.all(color: borderColor)
        ),
        child: child,
      ),
    );
  }
}