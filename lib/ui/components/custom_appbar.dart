import 'package:flutter/material.dart';
// import 'package:line_icons/line_icons.dart';

class CustomAppBar {
  /// Adds a leadingless & actionless AppBar choosing only few parameters
  PreferredSize titledAppBar(
    BuildContext context,
    String title,
    Color backgroundColor,
    Color textColor,
    double height,
  ) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        elevation: 5,
        scrolledUnderElevation: 5,
        surfaceTintColor: backgroundColor,
        shadowColor: Colors.black,
        backgroundColor: backgroundColor,
        title: Text(title),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Adds an AppBar with leading icon
  PreferredSize leadingAppBar(
      BuildContext context,
      String title,
      Color backgroundColor,
      Color textColor,
      double height,
      IconData? leadIcon,
      Color? iconColor,
      Function()? onPressed) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        elevation: 5,
        scrolledUnderElevation: 5,
        surfaceTintColor: backgroundColor,
        shadowColor: Colors.black,
        backgroundColor: backgroundColor,
        title: Text(title),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
        leadingWidth: 50, //default is 56
        leading: IconButton(
          onPressed: onPressed,
          icon: Icon(
            // LineIcons.angleLeft,
            leadIcon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
