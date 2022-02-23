import 'package:flutter/material.dart';

class BaseContainerOptions {
  ///This dictates how each screen is going to be displayed
  ///Controls the minor details like the color, topBar, bottomBar and others
  const BaseContainerOptions(
      {this.bottomBarColor = Colors.pink,
      this.color = Colors.pink,
      this.showBottomBar = false,
      this.padding = EdgeInsets.zero,
      this.showTopBar = false,
      this.animate = false,
      this.allowDebugging = true,
      this.backgroundColor = Colors.white});

  final Color? bottomBarColor, color, backgroundColor;
  final bool showBottomBar, allowDebugging, showTopBar, animate;
  final EdgeInsets? padding;

  ///A default of the [BaseContainerOptions] in its most basic form

  static const BaseContainerOptions defaultSetup = BaseContainerOptions();
  static BaseContainerOptions exerciseSetup = BaseContainerOptions(
      showBottomBar: false,
      showTopBar: true,
      allowDebugging: true,
      animate: true,
      backgroundColor: Colors.pink.withOpacity(.14),
      padding: EdgeInsets.zero);

  ///Returns a [String] representation of the object
  @override
  String toString() {
    Map<String, dynamic> collections = {
      'bottomBarColor': bottomBarColor,
      'color': color,
      'showBottomBar': showBottomBar,
      'allowDebugging': allowDebugging,
      'backgroundColor': backgroundColor,
    };
    return collections.toString();
  }

  BaseContainerOptions extend(
      {showBottomBar = false,
      showTopBar = false,
      allowDebugging = true,
      animate = false,
      padding = EdgeInsets.zero}) {
    return BaseContainerOptions(
        showBottomBar: showBottomBar,
        showTopBar: showTopBar,
        allowDebugging: allowDebugging,
        animate: animate,
        backgroundColor: Colors.pink.withOpacity(.14),
        padding: padding);
  }

  ///`BaseContainerOptions.copyWith` has been [deprecated]
  ///use `BaseContainerOptions.defaultSetup` instead.
  @Deprecated("")
  BaseContainerOptions copyWith(
      {allowDebugging = true,
      padding = EdgeInsets.zero,
      showBottomBar = false,
      backgroundColor = Colors.white,
      showTopBar = false,
      bottomBarColor}) {
    return const BaseContainerOptions();
  }
}
