import 'package:flutter/material.dart';
import 'package:travel_app/consts.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final double height;
  final IconData? leadingIcon;
  final IconData? actionIcon;

  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.height = kToolbarHeight,
    this.leadingIcon,
    this.actionIcon,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(actionIcon),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  color: kPrimaryColorDark,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Icon(leadingIcon),
          ],
        ),
      ),
    );
  }
}
