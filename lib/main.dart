import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stitch/data_layer/graph_ql.dart';
import 'package:stitch/state/route_state/route_map.dart';
import 'package:stitch/utilities/app_providers.dart';
import 'package:stitch/utilities/handle_orientation.dart';

void main() {
  runApp(const StitchAgent());
  HttpOverrides.global = MyHttpOverrides();
}

class StitchAgent extends StatefulWidget {
  const StitchAgent({Key? key}) : super(key: key);

  @override
  _StitchAgentState createState() => _StitchAgentState();
}

class _StitchAgentState extends State<StitchAgent> {
  @override
  Widget build(BuildContext context) {
    handleOrientation();
    // BridgeBase bridge = Provider.of<BridgeBase>(context, listen: false);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GraphQLProvider(
        client: client,
        child: MultiProvider(
          providers: appProviders,
          child: MaterialApp(
              builder: (context, widget) {
                ScreenUtil.setContext(context);
                return widget!;
              },
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme:
                    GoogleFonts.workSansTextTheme(Theme.of(context).textTheme),
              ),
              home: const StitchMainEntry()),
        ),
      ),
    );
  }
}

class StitchMainEntry extends StatefulWidget {
  const StitchMainEntry({
    Key? key,
  }) : super(key: key);

  @override
  State<StitchMainEntry> createState() => _StitchMainEntryState();
}

class _StitchMainEntryState extends State<StitchMainEntry> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Overlay(initialEntries: [
        OverlayEntry(
            builder: (context) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: PageMap.baseContainer,
                ))
      ]);
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
