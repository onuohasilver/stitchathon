import 'package:animate_do/animate_do.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stitch/global_components/progress_overlay.dart';
import 'package:stitch/state/bridge_state/bridge_methods.dart';
import 'package:stitch/state/route_state/route_state.dart';
import 'package:stitch/utilities/handle_back_navigation.dart';
import 'package:stitch/utilities/sizing.dart';

///Entry point for the app
class BaseContainer extends StatefulWidget {
  ///The root of the App
  ///
  ///Every Screen is simply a child of the [BaseContainer].
  ///
  ///Navigations controlled by the [RouteWatcher] simply act by changing the child of the [BaseContainer]
  ///Controlling how the bottombar is shown, the topBar and paddings are initiated by parsing
  ///a [BaseContainerOption] param to a [RouteWatcher] navigation method.
  ///
  ///Example to naviga
  ///te to a new screen
  ///
  ///```dart
  ///(){
  ///RouteWatcher routeWatcher=Provider.of<RouteWatcher>(context);
  ///routeWatcher.addToStack(PageMap.profile,options:BaseContainerOptions(bottomBar:true));}
  ///
  ///```
  ///
  ///This example shows a simple method to navigate to Profile Screen
  const BaseContainer({Key? key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState>? scaffoldKey;

  ///Screens where navigation is not allowed.
  ///Such screen are the dashboard view screens
  ///Whenever the User gets to any of these screens,
  ///navigating to a  previous screen is prohibited

  static final prohibited = [];

  @override
  _BaseContainerState createState() => _BaseContainerState();
}

class _BaseContainerState extends State<BaseContainer> {
  // ///Checks if the app has been exited

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    handleBackNavigation(context);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    RouteWatcher routeWatcher = Provider.of<RouteWatcher>(context);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      bridge(context).load('Context', context, BuildContext);
    });

    return WillPopScope(
      onWillPop: () async => handleBackNavigation(context),
      child: Scaffold(
        key: widget.scaffoldKey,
        body: SingleChildScrollView(
          child: ProgressOverlay(
            child: Container(
              height: size.height,
              width: size.width,
              color: Colors.white,
              child: Stack(
                children: [
                  SlideInRight(
                      key: Key(routeWatcher.currentScreen.toString()),
                      duration: const Duration(milliseconds: 400),
                      child: routeWatcher.currentScreen)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
}
