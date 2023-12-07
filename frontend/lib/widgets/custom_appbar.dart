import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: SvgPicture.asset('images/Header Logo.svg'),

      // leading: IconButton(
      //   icon: const Icon(Icons.menu, size: 32), // Icon on the left side

      //   onPressed: () {
      //     // Handle left icon press (e.g., open a drawer)
      //   },
      // ),
      actions: [
        IconButton(
            icon: const Icon(Icons.menu, size: 32, color: Colors.white),
            onPressed: () {})
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}
