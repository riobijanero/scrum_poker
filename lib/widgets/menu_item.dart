import 'package:flutter/material.dart';

class MenuItem {
  final String menuItemTitle;
  bool isSelected;
  final IconData menuItemicon;

  MenuItem({this.menuItemTitle, this.isSelected, this.menuItemicon});
}

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
                style: menuItem.isSelected ? TextStyle(color: Theme.of(context).iconTheme.color) : null),
          ],
        ),
      ),
    );
  }
}
