import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  const CircleButton(
      {Key? key,
      required this.mini,
      required this.icon,
      required this.iconSize,
      required this.color,
      required this.onPressed});

  final bool mini;
  final IconData icon;
  final double iconSize;
  final Color color;
  final VoidCallback onPressed;

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }
}

class _CircleButton extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
      backgroundColor: widget.color,
      mini: widget.mini,
      onPressed: widget.onPressed,
      child: Icon(
        widget.icon,
        size: widget.iconSize,
        color: Color(0xFF4268D3),
      ),
    ));
  }
}
