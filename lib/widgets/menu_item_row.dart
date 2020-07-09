import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenutItemRow extends StatelessWidget {
  final MenuItem menuItem;
  final void Function() onPressed;
  const MenutItemRow({this.menuItem, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(menuItem.menuItemicon),
            ),
            Text(menuItem.menuItemTitle,
                style: TextStyle(
                    fontSize: 24,
                    color: menuItem.isSelected
                        ? Theme.of(context).iconTheme.color
                        : null)),
          ],
        ),
      ),
    );
  }
}
