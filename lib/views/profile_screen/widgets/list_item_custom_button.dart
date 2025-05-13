import 'package:flutter/material.dart';

class ListItemButton extends StatelessWidget {
  const ListItemButton({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.trailing,
    required this.onTap,

  });

  final IconData leadingIcon;
  final String title;
  final Widget trailing;
  final Function() onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      onTap: onTap,
      title: Text(title),
      trailing: trailing,
    );
  }
}