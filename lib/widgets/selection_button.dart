import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class SelectionButton extends StatefulWidget {
  final void Function() onPress;
  final MenuItem menuItem;

  SelectionButton({
    @required this.menuItem,
    @required this.onPress,
  });
  @override
  _SelectionButtonState createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: AnimatedContainer(
        curve: Curves.easeOutQuint,
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: widget.menuItem.isSelected ? Colors.blueAccent : Colors.transparent,
            borderRadius: BorderRadius.circular(20.0)),
        child: Text(widget.menuItem.menuItemTitle,
            style: TextStyle(color: widget.menuItem.isSelected ? Colors.white : null, fontSize: 14)),
      ),
    );
  }
}
