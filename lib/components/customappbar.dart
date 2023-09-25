import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.leading,
    this.titleWidget,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25 / 2.5
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null ?
              Center(child: Text(title, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey[850]
              ),),)
              : Center(child: titleWidget!)
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                Transform.translate(
                  offset: const Offset(-14,0),
                  child: 
                  const BackButton()
                  )
              ],
            ),
          ] ),
        ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(
    double.maxFinite,
    80,
  );
}
