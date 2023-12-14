import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/widgets/helper/consts.dart';

class CustomAppBarHomeWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarHomeWidget({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Rehber',
            style: GoogleFonts.pacifico(
              textStyle: const TextStyle(
                  color: kPrimaryColorDark, letterSpacing: .5, fontSize: 25),
            ),
          ),
        ],
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.drag_handle,
              size: 35,
              color: kPrimaryColorDark,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
    );
  }
}
